USE core_db;

DROP TABLE IF EXISTS ChannelProductCoveragePlan;
  
CREATE TABLE ChannelProductCoveragePlan
(
    ClientId SMALLINT NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    ProductId SMALLINT NOT NULL,
    StoreNumber INT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ClientId, ChannelId, ProductId)
) DEFAULT CHARSET = utf8;


/*
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '0000', 6, 10, NOW());
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '0000', 7, 8, NOW());
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '0001', 6, 6, NOW());

INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000000', 6, 5, NOW());
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000000', 7, 4, NOW());

INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000001', 6, 5, NOW());
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000001', 7, 4, NOW());


INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000100', 6, 3, NOW());
INSERT ChannelProductCoveragePlan (ClientId, ChannelId, ProductId, StoreNumber, LastUpdate) VALUES (1, '000101', 6, 3, NOW());

*/
