USE core_db;

DROP PROCEDURE IF EXISTS addShelfResult;

DELIMITER //

CREATE PROCEDURE addShelfResult ( IN i_FileId INT, 
	                              IN i_ShelfType TINYINT, 
	                              IN i_ShelfId TINYINT,
	                              IN i_X1 DECIMAL(5, 1),
	                              IN i_Y1 DECIMAL(5, 1),
	                              IN i_X2 DECIMAL(5, 1),
	                              IN i_Y2 DECIMAL(5, 1),
	                              IN i_X3 DECIMAL(5, 1),
	                              IN i_Y3 DECIMAL(5, 1),
	                              IN i_X4 DECIMAL(5, 1),
	                              IN i_Y4 DECIMAL(5, 1),
	                              OUT o_ResultId INT
	                          )
BEGIN

    INSERT ShelfResult
        (FileId, ShelfType, ShelfId, X1, Y1, X2, Y2, X3, Y3, X4, Y4, LastUpdate)
    VALUES
        (i_FileId, i_ShelfType, i_ShelfId, i_X1, i_Y1, i_X2, i_Y2, i_X3, i_Y3, i_X4, i_Y4, NOW());

    SELECT @@IDENTITY INTO o_ResultId;

END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addShelfResult TO db_writer;

# CALL addShelfResult ( 1, 2, 3, 4444.4, 555.55, 66666.6, 77.77, -888.8, -9.99, 0, 0, @rid);
