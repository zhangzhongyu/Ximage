USE core_db;

DROP PROCEDURE IF EXISTS getChannelProductHistoryByChannelId;

DELIMITER //

CREATE PROCEDURE getChannelProductHistoryByChannelId ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20) )
BEGIN

    SELECT * FROM ChannelProductHistory
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelProductHistoryByChannelId TO db_reader;


# CALL getChannelProductHistoryByChannelId(2, '000001');
