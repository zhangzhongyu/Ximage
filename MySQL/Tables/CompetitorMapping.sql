USE core_db;

DROP TABLE IF EXISTS CompetitorMapping;

CREATE TABLE CompetitorMapping
(
    ProductId SMALLINT NOT NULL,
    CompetitorId SMALLINT NOT NULL,
    Status TINYINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ProductId, CompetitorId)
) DEFAULT CHARSET = utf8;


/*
INSERT CompetitorMapping (ProductId, CompetitorId, Status, LastUpdate) VALUES (6, 14, 1, NOW());


*/
