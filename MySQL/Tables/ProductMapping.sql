USE core_db;

DROP TABLE IF EXISTS ProductMapping;

CREATE TABLE ProductMapping
(
    ProductId SMALLINT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL,
    ProductUnit VARCHAR(2) NOT NULL,
    ProducerId SMALLINT NOT NULL,
    Status TINYINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ProductId)
) DEFAULT CHARSET = utf8;

CREATE INDEX ix_ProductMapping_ProducerId ON ProductMapping (ProducerId);
CREATE INDEX ix_ProductMapping_ProducerName ON ProductMapping (ProductName);

/*
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('香瓜子/五香味', '包', 1, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('原香瓜子/原味', '包', 1, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('香瓜子/凉茶味', '包', 1, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('香瓜子/奶香味', '包', 1, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('椒盐瓜子/椒盐味', '包', 1, 1, NOW());

INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('生抽/头道鲜特级', '瓶', 2, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('老抽/头道鲜特级', '瓶', 2, 1, NOW());

INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/550', '瓶', 3, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/550*6', '包', 3, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/5000', '瓶', 3, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/??', '瓶', 3, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/4000', '瓶', 3, 1, NOW());
INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('农夫山泉/750', '瓶', 3, 1, NOW());

INSERT ProductMapping (ProductName, ProductUnit, ProducerId, Status, LastUpdate) VALUES ('海天/金标生抽/500ml', '瓶', 4, 1, NOW());

*/
