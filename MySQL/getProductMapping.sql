USE core_db;

DROP PROCEDURE IF EXISTS getProductMapping;

DELIMITER //

CREATE PROCEDURE getProductMapping ( IN i_ProductId SMALLINT )
BEGIN

    SELECT * FROM ProductMapping
        WHERE ProductId = i_ProductId
        AND Status = 1;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getProductMapping TO db_reader;


# CALL getProductMapping(1);
