-- auto Generated on 2020-12-18
#课程分类
DROP TABLE IF EXISTS course_category;
CREATE TABLE course_category(
	id char (8) NOT NULL COMMENT 'id',
	course_id char (8) NOT NULL DEFAULT '' COMMENT '课程|course.id',
	category_id char (8) NOT NULL DEFAULT '' COMMENT '分类|category.id',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '课程分类';
