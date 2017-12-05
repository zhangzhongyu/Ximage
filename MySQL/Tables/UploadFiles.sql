USE core_db;

DROP TABLE IF EXISTS UploadFiles;

CREATE TABLE UploadFiles
(
	FileId INT NOT NULL AUTO_INCREMENT,
    FileName VARCHAR(255) NOT NULL,
    ClientId SMALLINT NOT NULL,
    UserId VARCHAR(25) NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    EffectiveDate DATE NOT NULL,
    Status TINYINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (FileId)
) DEFAULT CHARSET = utf8;

CREATE INDEX ix_UploadFiles_ChannelId ON UploadFiles (ClientId, ChannelId);
CREATE INDEX ix_UploadFiles_EffectiveDate ON UploadFiles (EffectiveDate);