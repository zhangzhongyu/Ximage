USE core_db;

DROP PROCEDURE IF EXISTS getChannelProductCoveragePlanByChannelId;

DELIMITER //

CREATE PROCEDURE getChannelProductCoveragePlanByChannelId ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20) )
BEGIN

    SELECT * FROM ChannelProductCoveragePlan
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelProductCoveragePlanByChannelId TO db_reader;


# CALL getChannelProductCoveragePlanByChannelId(1, '000001');
