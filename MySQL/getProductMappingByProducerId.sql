USE core_db;

DROP PROCEDURE IF EXISTS getProductMappingByProducerId;

DELIMITER //

CREATE PROCEDURE getProductMappingByProducerId ( IN i_ProducerId SMALLINT )
BEGIN

    SELECT * FROM ProductMapping
        WHERE ProducerId = i_ProducerId
        AND Status = 1;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getProductMappingByProducerId TO db_reader;


# CALL getProductMappingByProducerId(1);
