DROP PROCEDURE IF EXISTS addUploadFiles;

DELIMITER //

CREATE PROCEDURE addUploadFiles ( IN i_FileName VARCHAR(255),
	                              IN i_ClientId SMALLINT,
	                              IN i_UserId VARCHAR(25),
	                              IN i_ChannelId VARCHAR(20),
	                              IN i_EffectiveDate DATE,
	                              IN i_Status TINYINT,
	                              OUT o_FileId INT
	                            )
BEGIN

    INSERT UploadFiles
        (FileName, ClientId, UserId, ChannelId, EffectiveDate, Status, LastUpdate)
    VALUES
        (i_FileName, i_ClientId, i_UserId, i_ChannelId, i_EffectiveDate, i_Status, NOW());

    SELECT @@IDENTITY INTO o_FileId;

END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addUploadFiles TO db_writer;

# CALL addUploadFiles ( 'TEST.TXT', 0, 'JOEY', '0000000000', DATE(NOW()), 1, @fid);
# SELECT @fid;