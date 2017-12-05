USE core_db;

DROP PROCEDURE IF EXISTS getUploadFilesByChannelId;

DELIMITER //

CREATE PROCEDURE getUploadFilesByChannelId ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20), IN i_EffectiveDate DATE )
BEGIN

    SELECT * FROM UploadFiles
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId
        AND EffectiveDate = IFNULL(i_EffectiveDate, EffectiveDate)
        AND Status = 1
        ORDER BY EffectiveDate DESC, FileId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getUploadFilesByChannelId TO db_reader;


# CALL getUploadFilesByChannelId(1, '00000000', '2017-11-27');
# CALL getUploadFilesByChannelId(1, '00000000', NULL);
