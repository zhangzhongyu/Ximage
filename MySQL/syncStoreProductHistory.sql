DROP PROCEDURE IF EXISTS syncStoreProductHistory;

DELIMITER //

CREATE PROCEDURE syncStoreProductHistory ( IN i_EffectiveDate DATE, IN i_ClientId SMALLINT  )

BEGIN


    CREATE TEMPORARY TABLE tmp_StoreProduct (
        EffectiveDate DATE NOT NULL,
        ClientId SMALLINT NOT NULL,
        StoreId VARCHAR(20) NOT NULL,
        ProductId SMALLINT NOT NULL,
        DisplayNumber INT NOT NULL,
        PRIMARY KEY (EffectiveDate, ClientId, StoreId, ProductId)
        );
    
    INSERT INTO tmp_StoreProduct
        (EffectiveDate, ClientId, StoreId, ProductId, DisplayNumber)
        SELECT a.EffectiveDate, a.ClientId, a.ChannelId, b.ObjectType, COUNT(*)
            FROM UploadFiles a, ObjResult b, ProductMapping c
            WHERE a.FileId = b.FileId
            AND b.ObjectType = c.ProductId
            AND a.ClientId = i_ClientId
            AND a.EffectiveDate = i_EffectiveDate
            GROUP BY a.EffectiveDate, a.ClientId, a.ChannelId, b.ObjectType;

    SET SQL_SAFE_UPDATES = 0; 

    UPDATE StoreProductHistory a, tmp_StoreProduct b
        SET a.DisplayNumber = b.DisplayNumber,
            a.LastUpdate = NOW()
        WHERE a.EffectiveDate = b.EffectiveDate
        AND a.ClientId = b.ClientId
        AND a.ChannelId = b.StoreId
        AND a.ProductId = b.ProductId;

    SET SQL_SAFE_UPDATES = 1; 

    INSERT INTO StoreProductHistory
        (EffectiveDate, ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate)
        SELECT b.EffectiveDate, b.ClientId, b.StoreId, b.ProductId, b.DisplayNumber, NOW()
            FROM tmp_StoreProduct b
            WHERE NOT EXISTS (
                SELECT * FROM StoreProductHistory a
                    WHERE a.EffectiveDate = b.EffectiveDate
                    AND a.ClientId = b.ClientId
                    AND a.ChannelId = b.StoreId
                    AND a.ProductId = b.ProductId
                );

    DROP TEMPORARY TABLE tmp_StoreProduct;

    # Aggregate the data for entire channel tree
    CALL calcChannelProductStatistics(i_EffectiveDate, i_ClientId);

END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE syncStoreProductHistory TO db_writer;

# CALL syncStoreProductHistory(DATE(NOW()), 1);
# CALL syncStoreProductHistory('2017-11-27', 1);
