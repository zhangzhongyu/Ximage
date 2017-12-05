USE core_db;

DROP PROCEDURE IF EXISTS getUploadFiles;

DELIMITER //

CREATE PROCEDURE getUploadFiles ( IN i_FileId INT )
BEGIN

    SELECT * FROM UploadFiles
        WHERE FileId = i_FileId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getUploadFiles TO db_reader;

# CALL getUploadFiles(1);
