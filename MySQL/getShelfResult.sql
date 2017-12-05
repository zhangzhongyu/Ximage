USE core_db;

DROP PROCEDURE IF EXISTS getShelfResult;

DELIMITER //

CREATE PROCEDURE getShelfResult ( IN i_ResultId INT )
BEGIN

    SELECT * FROM ShelfResult
        WHERE ResultId = i_ResultId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getShelfResult TO db_reader;

# CALL getShelfResult(1);
