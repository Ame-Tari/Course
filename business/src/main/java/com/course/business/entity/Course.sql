-- auto Generated on 2020-12-16
DROP TABLE IF EXISTS course;
CREATE TABLE course(
	id CHAR (8) NOT NULL COMMENT 'id',
	`name` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '名称',
	summary VARCHAR (50) NOT NULL DEFAULT '' COMMENT '概述',
	`time` INT (11) NOT NULL DEFAULT -1 COMMENT '时长|单位秒',
	price DECIMAL (13,4) NOT NULL DEFAULT -1 COMMENT '价格（元）',
	image VARCHAR (50) NOT NULL DEFAULT '' COMMENT '封面',
	`level` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '级别|ONE("1", "初级"),TWO("2", "中级"),THREE("3", "高级")',
	charge VARCHAR (50) NOT NULL DEFAULT '' COMMENT '收费|CHARGE("C", "收费"),FREE("F", "免费")',
	`status` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '状态|PUBLISH("P", "发布"),DRAFT("D", "草稿")',
	enroll INT (11) NOT NULL DEFAULT -1 COMMENT '报名数',
	sort INT (11) NOT NULL DEFAULT -1 COMMENT '顺序',
	created_at DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '创建时间',
	updated_at DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '修改时间',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '课程';

insert into course(id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
VALUES ('0000001', '慕课', '在线视频', 7200, 19.9, '', 0, 'C', 'D', 100, 0, now(), now());
