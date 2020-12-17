-- auto Generated on 2020-12-08
DROP TABLE IF EXISTS chapter;
CREATE TABLE chapter(
	id CHAR (8) NOT NULL COMMENT 'ID',
	course_id CHAR (8) NOT NULL COMMENT '课程id',
	`name` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '名称',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '大章';


update course c
set 'time' = (select sum('time') from 'section' where course_id = '')
where c.id = '';
