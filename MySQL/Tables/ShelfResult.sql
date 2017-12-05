USE core_db;

DROP TABLE IF EXISTS ShelfResult;

CREATE TABLE ShelfResult
(
    ResultId INT NOT NULL AUTO_INCREMENT,
    FileId INT NOT NULL,
    ShelfType TINYINT NOT NULL,
    ShelfId TINYINT NULL,
    X1 DECIMAL(5, 1) NULL,
    Y1 DECIMAL(5, 1) NULL,
    X2 DECIMAL(5, 1) NULL,
    Y2 DECIMAL(5, 1) NULL,
    X3 DECIMAL(5, 1) NULL,
    Y3 DECIMAL(5, 1) NULL,
    X4 DECIMAL(5, 1) NULL,
    Y4 DECIMAL(5, 1) NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ResultId)
);

