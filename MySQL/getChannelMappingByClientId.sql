USE core_db;

DROP PROCEDURE IF EXISTS getChannelMappingByClientId;

DELIMITER //

CREATE PROCEDURE getChannelMappingByClientId ( IN i_ClientId SMALLINT )
BEGIN

    SELECT * FROM ChannelMapping
        WHERE ClientId = i_ClientId
        AND Status = 1
        ORDER BY ChannelId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelMappingByClientId TO db_reader;


# CALL getChannelMappingByClientId(2);
