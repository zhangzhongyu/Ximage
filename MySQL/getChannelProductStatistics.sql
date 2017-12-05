USE core_db;

DROP PROCEDURE IF EXISTS getChannelProductStatistics;

DELIMITER //

CREATE PROCEDURE getChannelProductStatistics ( IN i_EffectiveDate DATE, IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20), IN i_ProductId SMALLINT)
BEGIN

    SELECT * FROM ChannelProductStatistics
        WHERE EffectiveDate = i_EffectiveDate 
        AND ClientId = i_ClientId 
        AND ChannelId = i_ChannelId
        AND ProductId = i_ProductId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelProductStatistics TO db_reader;


# CALL getChannelProductStatistics('2017-11-27', 1, '0000', 6);
