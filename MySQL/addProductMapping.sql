DROP PROCEDURE IF EXISTS addProductMapping;

DELIMITER //

CREATE PROCEDURE addProductMapping ( IN i_ProductName VARCHAR(255),
	                                 IN i_ProductUnit VARCHAR(2),
                                     IN i_ProducerId SMALLINT
                                   )
BEGIN

    INSERT ProductMapping
        (ProductName, ProductUnit, ProducerId, Status, LastUpdate)
    VALUES
        (i_ProductName, i_ProductUnit, i_ProducerId, 1, NOW());


END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addProductMapping TO db_writer;

