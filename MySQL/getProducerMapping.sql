USE core_db;

DROP PROCEDURE IF EXISTS getProducerMapping;

DELIMITER //

CREATE PROCEDURE getProducerMapping ( IN i_ProducerId SMALLINT )
BEGIN

    SELECT * FROM ProducerMapping
        WHERE ProducerId = i_ProducerId
        AND Status = 1;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getProducerMapping TO db_reader;


# CALL getProducerMapping(1);
