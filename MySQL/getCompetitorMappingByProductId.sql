USE core_db;

DROP PROCEDURE IF EXISTS getCompetitorMappingByProductId;

DELIMITER //

CREATE PROCEDURE getCompetitorMappingByProductId ( IN i_ProductId SMALLINT )
BEGIN

    SELECT * FROM CompetitorMapping
        WHERE ProductId = i_ProductId
        AND Status = 1
        ORDER BY CompetitorId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getCompetitorMappingByProductId TO db_reader;


# CALL getCompetitorMappingByProductId(6);
