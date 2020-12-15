-- auto Generated on 2020-12-14
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`
(
    id         VARCHAR(50) NOT NULL COMMENT 'ID',
    title      VARCHAR(50) NOT NULL DEFAULT '' COMMENT '标题',
    course_id  VARCHAR(50) NOT NULL DEFAULT '' COMMENT '课程ID',
    chapter_id VARCHAR(50) NOT NULL DEFAULT '' COMMENT '大章ID',
    video      VARCHAR(50) NOT NULL DEFAULT '' COMMENT '视频',
    `time`     INT(11)     NOT NULL DEFAULT -1 COMMENT '时长',
    charge     VARCHAR(50) NOT NULL DEFAULT '' COMMENT '收费',
    sort       INT(11)     NOT NULL DEFAULT -1 COMMENT '顺序',
    created_at DATETIME    NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '创建时间',
    updated_at DATETIME    NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '更新时间',
    vod        VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'vod',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT '小节';
insert into section (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000001', '测试小节01','0000001', '00000000', '','500', 'F', 1, now(), now());
