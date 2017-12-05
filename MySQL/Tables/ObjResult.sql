USE core_db;

DROP TABLE IF EXISTS ObjResult;

CREATE TABLE ObjResult
(
    ResultId INT NOT NULL AUTO_INCREMENT,
    FileId INT NOT NULL,
    ObjectId SMALLINT NOT NULL,
    ObjectType SMALLINT NOT NULL,
    ShelfId TINYINT NULL,
    PosX DECIMAL(7, 3) NOT NULL,
    PosY DECIMAL(7, 3) NOT NULL,
    Width DECIMAL(7, 3) NOT NULL,
    Height DECIMAL(7, 3) NOT NULL,
    Confidence DECIMAL(7, 6) NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ResultId)
);

CREATE INDEX ix_ObjResult_FileId ON ObjResult (FileId);