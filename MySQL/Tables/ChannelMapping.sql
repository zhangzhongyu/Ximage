USE core_db;

DROP TABLE IF EXISTS ChannelMapping;

# ChannelId: the first two char, '00', is deserved by system. Followed each two char describe one level of distribution channel
#  
CREATE TABLE ChannelMapping
(
    ClientId SMALLINT NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    ChannelName VARCHAR(100) NOT NULL,
    Status TINYINT NOT NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (ClientId, ChannelId)
) DEFAULT CHARSET = utf8;


/*
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '0000', '北京', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '0001', '上海', 1, NOW());

INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '000000', '张三', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '000001', '李四', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '000100', '王五', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '000101', '赵六', 1, NOW());

INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00000000', '东直门店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00000001', '三里屯店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00000100', '西单店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00000101', '中关村店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00010000', '南京西路店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00010001', '人民公园店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00010100', '陆家嘴店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (2, '00010101', '八佰伴店', 1, NOW());


INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '0000', '图译中国', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '0001', '图译国际', 1, NOW());

INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '000000', '图译深圳', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '000001', '图译上海', 1, NOW());

INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '00000000', '福田店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '00000001', '罗湖店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '00000002', '南山店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '00000100', '静安店', 1, NOW());
INSERT ChannelMapping (ClientId, ChannelId, ChannelName, Status, LastUpdate) VALUES (1, '00000101', '浦东店', 1, NOW());


*/
