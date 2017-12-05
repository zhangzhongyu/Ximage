DROP PROCEDURE IF EXISTS addChannelProductHistory;

DELIMITER //

CREATE PROCEDURE addChannelProductHistory ( IN i_EffectiveDate DATE, IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20), IN i_ProductId SMALLINT )

BEGIN

    INSERT ChannelProductHistory
        (EffectiveDate, ClientId, ChannelId, ProductId, LastUpdate)
    VALUES
        (i_EffectiveDate, i_ClientId, i_ChannelId, i_ProductId, NOW());


END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE addChannelProductHistory TO db_writer;

