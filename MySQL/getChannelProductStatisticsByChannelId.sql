#
#  getChannelProductStatisticsByChannelId
#  @para: IN i_Client SMALLINT
#         IN i_ChannelId VARCHAR(20)
#         IN i_ProductId NULL
#  @out:  * FROM ChannelProductStatistics
#  @updated: 2017-12-05 by Joey Z
#

USE core_db;

DROP PROCEDURE IF EXISTS getChannelProductStatisticsByChannelId;

DELIMITER //

CREATE PROCEDURE getChannelProductStatisticsByChannelId ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20), IN i_ProductId SMALLINT )
BEGIN

    SELECT * FROM ChannelProductStatistics
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId
        AND ProductId = IFNULL(i_ProductId, ProductId)
        ORDER BY EffectiveDate DESC, ProductId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getChannelProductStatisticsByChannelId TO db_reader;


# CALL getChannelProductStatisticsByChannelId(1, '0000', NULL);
# CALL getChannelProductStatisticsByChannelId(1, '0000', 6);
