-- auto Generated on 2020-12-18
DROP TABLE IF EXISTS course_content;
# 大字段设置为单独的表  垂直分段的情况：1.大字段 2 经常更新的字段
CREATE TABLE course_content(
	id char (8) NOT NULL COMMENT 'id',
	content mediumtext  NOT NULl COMMENT '课程内容',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '课程内容';
