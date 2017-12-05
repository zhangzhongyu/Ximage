USE core_db;

DROP PROCEDURE IF EXISTS getChannelMapping;

DELIMITER //

CREATE PROCEDURE getChannelMapping ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20) )
BEGIN

    SELECT * FROM ChannelMapping
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId
        AND Status = 1;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelMapping TO db_reader;


# CALL getChannelMapping(2, '000001');
