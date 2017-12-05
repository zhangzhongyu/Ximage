USE core_db;

DROP TABLE IF EXISTS StoreProductHistory;

# Save all products for each channel per day
CREATE TABLE StoreProductHistory
(
	EffectiveDate DATE NOT NULL,
	ClientId SMALLINT NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    ProductId SMALLINT NOT NULL,
    DisplayNumber SMALLINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (EffectiveDate, ClientId, ChannelId, ProductId)
) DEFAULT CHARSET = utf8;

CREATE INDEX ix_StoreProductHistory_ProductId ON StoreProductHistory (ProductId);
CREATE INDEX ix_StoreProductHistory_ChannelId ON StoreProductHistory (ClientId, ChannelId);



