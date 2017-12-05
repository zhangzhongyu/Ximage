DROP PROCEDURE IF EXISTS calcChannelProductStatistics;

DELIMITER //

CREATE PROCEDURE calcChannelProductStatistics ( IN i_EffectiveDate DATE, IN i_ClientId SMALLINT  )

BEGIN

    CREATE TEMPORARY TABLE tmp_ChannelProduct (
        EffectiveDate DATE NOT NULL,
        ClientId SMALLINT NOT NULL,
        ChannelId VARCHAR(20) NOT NULL,
        ProductId SMALLINT NOT NULL,
        StoreNumber INT NOT NULL,
        MaxCoverage INT NOT NULL DEFAULT 0,
        DisplayRate DECIMAL(5, 2) NULL,
        PRIMARY KEY (EffectiveDate, ClientId, ChannelId, ProductId)
        );

    # Aggregate at store level
    INSERT INTO tmp_ChannelProduct (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        StoreNumber,
        MaxCoverage,
        DisplayRate
        )
        SELECT a.EffectiveDate, 
               a.ClientId,
               a.ChannelId,
               a.ProductId,
               1,
               1,
               IFNULL(a.DisplayNumber / b.DisplayNumber, 1)
            FROM StoreProductHistory a  # only care about planned products, filtering out mis-matched, competitors and else
                INNER JOIN StoreProductDisplayPlan b 
                ON a.ClientId = b.ClientId
                AND a.ChannelId = b.ChannelId
                AND a.ProductId = b.ProductId
            WHERE a.EffectiveDate = i_EffectiveDate
            AND a.ClientId = i_ClientId;

    # Self-aggregated at distributor level
    CREATE TEMPORARY TABLE tmp_ChannelProduct2 (
        EffectiveDate DATE NOT NULL,
        ClientId SMALLINT NOT NULL,
        ChannelId VARCHAR(20) NOT NULL,
        ProductId SMALLINT NOT NULL,
        StoreNumber INT NOT NULL,
        MaxCoverage INT NOT NULL DEFAULT 0,
        DisplayRate DECIMAL(5, 2) NULL
        );


    INSERT INTO tmp_ChannelProduct2 (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        StoreNumber,
        MaxCoverage,
        DisplayRate
        )
        SELECT a.EffectiveDate, 
               a.ClientId,
               LEFT(a.ChannelId, 6),
               a.ProductId,
               SUM(a.StoreNumber),
               SUM(a.MaxCoverage),
               AVG(a.DisplayRate)
            FROM tmp_ChannelProduct a
            WHERE LENGTH(ChannelId) = 8
            GROUP BY EffectiveDate, ClientId, LEFT(ChannelId, 6), ProductId;

    INSERT INTO tmp_ChannelProduct (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        StoreNumber,
        MaxCoverage,
        DisplayRate
        )
        SELECT a.EffectiveDate, 
               a.ClientId,
               a.ChannelId,
               a.ProductId,
               a.StoreNumber,
               a.MaxCoverage,
               a.DisplayRate
            FROM tmp_ChannelProduct2 a;


    # Self-aggregated at city level
    CREATE TEMPORARY TABLE tmp_ChannelProduct3 (
        EffectiveDate DATE NOT NULL,
        ClientId SMALLINT NOT NULL,
        ChannelId VARCHAR(20) NOT NULL,
        ProductId SMALLINT NOT NULL,
        StoreNumber INT NOT NULL,
        MaxCoverage INT NOT NULL DEFAULT 0,
        DisplayRate DECIMAL(5, 2) NULL
        );


    INSERT INTO tmp_ChannelProduct3 (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        StoreNumber,
        MaxCoverage,
        DisplayRate
        )
        SELECT a.EffectiveDate, 
               a.ClientId,
               LEFT(a.ChannelId, 4),
               a.ProductId,
               SUM(a.StoreNumber),
               SUM(a.MaxCoverage),
               AVG(a.DisplayRate)
            FROM tmp_ChannelProduct2 a
            WHERE LENGTH(ChannelId) = 6
            GROUP BY EffectiveDate, ClientId, LEFT(ChannelId, 4), ProductId;


    INSERT INTO tmp_ChannelProduct (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        StoreNumber,
        MaxCoverage,
        DisplayRate
        )
        SELECT a.EffectiveDate, 
               a.ClientId,
               a.ChannelId,
               a.ProductId,
               a.StoreNumber,
               a.MaxCoverage,
               a.DisplayRate
            FROM tmp_ChannelProduct3 a;


    SELECT @MaxDate := EffectiveDate
        FROM ChannelProductStatistics
        WHERE ClientId = i_ClientId
        AND EffectiveDate <= i_EffectiveDate
        ORDER BY EffectiveDate DESC
        LIMIT 1;


    SET SQL_SAFE_UPDATES = 0; 

    IF @MaxDate IS NULL THEN

        UPDATE tmp_ChannelProduct a
            SET a.MaxCoverage = a.StoreNumber
            WHERE a.EffectiveDate = i_EffectiveDate
            AND a.ClientId = i_ClientId;

    ELSE

        UPDATE tmp_ChannelProduct a, ChannelProductStatistics b 
            SET a.MaxCoverage = b.MaxCoverage
            WHERE a.EffectiveDate = b.EffectiveDate 
            AND a.ClientId = b.ClientId 
            AND a.ChannelId = b.ChannelId 
            AND a.ProductId = b.ProductId
            AND b.EffectiveDate = @MaxDate;

    END IF;

    SET SQL_SAFE_UPDATES = 1; 

    # Channel level
    INSERT INTO ChannelProductStatistics (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        MaxCoverage,
        CoverageRate,
        DistributionRate,
        OutOfStockRate,
        DisplayRate,
        DisplayQuality,
        CompetitorId1,
        CompetingDisplayRate1,
        CompetingDisplayQuality1,
        CompetitorId2,
        CompetingDisplayRate2,
        CompetingDisplayQuality2,
        LastUpdate
        )
    SELECT i_EffectiveDate, 
           i_ClientId,
           a.ChannelId,
           a.ProductId,
           IF(b.MaxCoverage > b.StoreNumber, b.MaxCoverage, b.StoreNumber),
           NULL,
           b.StoreNumber / a.StoreNumber,
           1 - b.StoreNumber / b.MaxCoverage,
           b.DisplayRate,
           NULL,
           NULL, NULL, NULL,
           NULL, NULL, NULL,
           NOW()
        FROM ChannelProductCoveragePlan a # only care about planned products, filtering out mis-matched, competitors and else
            LEFT JOIN tmp_ChannelProduct b ON a.ClientId = b.ClientId AND a.ChannelId = b.ChannelId AND a.ProductId = b.ProductId
        WHERE a.ClientId = i_ClientId
        AND b.EffectiveDate = i_EffectiveDate
    ON DUPLICATE KEY UPDATE
        MaxCoverage = IF(b.MaxCoverage > b.StoreNumber, b.MaxCoverage, b.StoreNumber),
        CoverageRate = NULL,
        DistributionRate = b.StoreNumber / a.StoreNumber,
        OutOfStockRate = 1 - b.StoreNumber / b.MaxCoverage,
        DisplayRate = b.DisplayRate,
        DisplayQuality = NULL,
        CompetitorId1 = NULL,
        CompetingDisplayRate1 = NULL,
        CompetingDisplayQuality1 = NULL,
        CompetitorId2 = NULL,
        CompetingDisplayRate2 = NULL,
        CompetingDisplayQuality2 = NULL,
        LastUpdate = NOW();

    # Store level
    INSERT INTO ChannelProductStatistics (
        EffectiveDate,
        ClientId,
        ChannelId,
        ProductId,
        MaxCoverage,
        CoverageRate,
        DistributionRate,
        OutOfStockRate,
        DisplayRate,
        DisplayQuality,
        CompetitorId1,
        CompetingDisplayRate1,
        CompetingDisplayQuality1,
        CompetitorId2,
        CompetingDisplayRate2,
        CompetingDisplayQuality2,
        LastUpdate
        )
    SELECT i_EffectiveDate, 
           i_ClientId,
           b.ChannelId,
           b.ProductId,
           IF(b.MaxCoverage > b.StoreNumber, b.MaxCoverage, b.StoreNumber),
           NULL,
           1,
           0,
           b.DisplayRate,
           NULL,
           NULL, NULL, NULL,
           NULL, NULL, NULL,
           NOW()
        FROM tmp_ChannelProduct b
        WHERE b.ClientId = i_ClientId
        AND b.EffectiveDate = i_EffectiveDate
        AND LENGTH(b.ChannelId) = 8
    ON DUPLICATE KEY UPDATE
        MaxCoverage = IF(b.MaxCoverage > b.StoreNumber, b.MaxCoverage, b.StoreNumber),
        CoverageRate = NULL,
        DistributionRate = 1,
        OutOfStockRate = 0,
        DisplayRate = b.DisplayRate,
        DisplayQuality = NULL,
        CompetitorId1 = NULL,
        CompetingDisplayRate1 = NULL,
        CompetingDisplayQuality1 = NULL,
        CompetitorId2 = NULL,
        CompetingDisplayRate2 = NULL,
        CompetingDisplayQuality2 = NULL,
        LastUpdate = NOW();


    DROP TEMPORARY TABLE tmp_ChannelProduct;
    DROP TEMPORARY TABLE tmp_ChannelProduct2;
    DROP TEMPORARY TABLE tmp_ChannelProduct3;

END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE calcChannelProductStatistics TO db_writer;

# CALL calcChannelProductStatistics(DATE(NOW()), 1);
# CALL calcChannelProductStatistics('2017-11-27', 1);