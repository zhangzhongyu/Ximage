USE core_db;

DROP PROCEDURE IF EXISTS getObjResult;

DELIMITER //

CREATE PROCEDURE getObjResult ( IN i_ResultId INT )
BEGIN

    SELECT * FROM ObjResult
        WHERE ResultId = i_ResultId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getObjResult TO db_reader;

# CALL getObjResult(1);
