-- auto Generated on 2020-12-17
DROP TABLE IF EXISTS category;
CREATE TABLE category(
	id char(8) NOT NULL COMMENT 'id',
	parent char (8) NOT NULL DEFAULT '' COMMENT '父id',
	`name` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '名称',
	sort INT (11)  DEFAULT -1 COMMENT '顺序',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '分类';

insert into category (id, parent, name, sort)
VALUES ('00000010', '00000001', '前端技术', 100);

