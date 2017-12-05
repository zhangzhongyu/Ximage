DROP PROCEDURE IF EXISTS addObjResult;

DELIMITER //

CREATE PROCEDURE addObjResult ( IN i_FileId INT, 
	                            IN i_ObjectId SMALLINT, 
	                            IN i_ObjectType SMALLINT, 
	                            IN i_ShelfId TINYINT,
	                            IN i_PosX DECIMAL(7, 3),
	                            IN i_PosY DECIMAL(7, 3),
	                            IN i_Width DECIMAL(7, 3),
	                            IN i_Height DECIMAL(7, 3),
	                            IN i_Confidence DECIMAL(7, 6),
	                            OUT o_ResultId INT
	                          )
BEGIN

    INSERT ObjResult
        (FileId, ObjectId, ObjectType, ShelfId, PosX, PosY, Width, Height, Confidence, LastUpdate)
    VALUES
        (i_FileId, i_ObjectId, i_ObjectType, i_ShelfId, i_PosX, i_PosY, i_Width, i_Height, i_Confidence, NOW());

    SELECT @@IDENTITY INTO o_ResultId;

END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addObjResult TO db_writer;


# CALL addObjResult ( 1, 2, 3, 4, 555.555, 66.66, 77.7777, -888.888, 0.987654, @rid);
