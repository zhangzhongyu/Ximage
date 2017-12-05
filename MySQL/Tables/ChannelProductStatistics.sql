USE core_db;

DROP TABLE IF EXISTS ChannelProductStatistics;
  
CREATE TABLE ChannelProductStatistics
(
    EffectiveDate DATE NOT NULL,
    ClientId SMALLINT NOT NULL,
    ChannelId VARCHAR(20) NOT NULL,
    ProductId SMALLINT NOT NULL,
    MaxCoverage SMALLINT NOT NULL DEFAULT 0,            # 动态历史分销数（历史最高分销数）
    CoverageRate DECIMAL(5, 2) NULL,                    # 覆盖率
    DistributionRate DECIMAL(5, 2) NOT NULL DEFAULT 0,  # 分销率 = 1 - 缺品率
    OutOfStockRate DECIMAL(5, 2) NOT NULL DEFAULT 0,    # 缺货率
    DisplayRate DECIMAL(5, 2) NOT NULL DEFAULT 0,       # 陈列排面达标率
    DisplayQuality DECIMAL(5, 2) NULL,                  # 陈列位置达标率
    CompetitorId1 SMALLINT NULL,                        # 竞品1
    CompetingDisplayRate1 DECIMAL(5, 2) NULL,           # 排面个数/竞品1个数
    CompetingDisplayQuality1 DECIMAL(5, 2) NULL,        # 陈列位置/竞品1位置
    CompetitorId2 SMALLINT NULL,
    CompetingDisplayRate2 DECIMAL(5, 2) NULL,
    CompetingDisplayQuality2 DECIMAL(5, 2) NULL,
    LastUpdate DATETIME NOT NULL,
    PRIMARY KEY (EffectiveDate, ClientId, ChannelId, ProductId)
) DEFAULT CHARSET = utf8;


