USE core_db;

DROP PROCEDURE IF EXISTS getStoreProductDisplayPlanByChannelId;

DELIMITER //

CREATE PROCEDURE getStoreProductDisplayPlanByChannelId ( IN i_ClientId SMALLINT, IN i_ChannelId VARCHAR(20) )
BEGIN

    SELECT * FROM StoreProductDisplayPlan
        WHERE ClientId = i_ClientId 
        AND ChannelId = i_ChannelId;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getStoreProductDisplayPlanByChannelId TO db_reader;


# CALL getStoreProductDisplayPlanByChannelId(1, '00000001');
