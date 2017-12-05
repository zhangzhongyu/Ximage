USE core_db;

DROP TABLE IF EXISTS StoreProductDisplayPlan;
  
CREATE TABLE StoreProductDisplayPlan
(
    ClientId SMALLINT NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    ProductId SMALLINT NOT NULL,
    DisplayNumber SMALLINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ClientId, ChannelId, ProductId)
) DEFAULT CHARSET = utf8;


/*
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00000000', 6, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00000000', 7, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00000001', 6, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00000001', 7, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00010000', 6, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00010000', 7, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00010001', 6, 10, NOW());
INSERT StoreProductDisplayPlan (ClientId, ChannelId, ProductId, DisplayNumber, LastUpdate) VALUES (1, '00010001', 7, 10, NOW());


*/
