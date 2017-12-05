USE core_db;

DROP PROCEDURE IF EXISTS getProducerMappingAll;

DELIMITER //

CREATE PROCEDURE getProducerMappingAll()
BEGIN

    SELECT * FROM ProducerMapping
        WHERE Status = 1;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getProducerMappingAll TO db_reader;


# CALL getProducerMappingAll();
