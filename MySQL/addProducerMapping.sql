DROP PROCEDURE IF EXISTS addProducerMapping;

DELIMITER //

CREATE PROCEDURE addProducerMapping ( IN i_ProducerName VARCHAR(100)
                                    )
BEGIN

    INSERT ProducerMapping
        (ProducerName, Status, LastUpdate)
    VALUES
        (ProducerName, 1, NOW());


END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addProducerMapping TO db_writer;

