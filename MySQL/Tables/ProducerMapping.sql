USE core_db;

DROP TABLE IF EXISTS ProducerMapping;

CREATE TABLE ProducerMapping
(
    ProducerId SMALLINT NOT NULL AUTO_INCREMENT,
    ProducerName VARCHAR(100) NOT NULL,
    Status TINYINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ProducerId)
) DEFAULT CHARSET = utf8;

/*

INSERT ProducerMapping (ProducerName, Status, LastUpdate) VALUES ('洽洽', 1,  NOW());
INSERT ProducerMapping (ProducerName, Status, LastUpdate) VALUES ('淘大', 1,  NOW());
INSERT ProducerMapping (ProducerName, Status, LastUpdate) VALUES ('农夫山泉', 1,  NOW());
INSERT ProducerMapping (ProducerName, Status, LastUpdate) VALUES ('海天味业', 1,  NOW());

*/
