#--------------课程分类
drop table if exists `course_category`;
create table `course_category`(
  `id` char(8) not null default '' comment 'id',
  `course_id` char(8) comment '课程|course.id',
  `category_id` char(8) comment '分类|course.id',
  primary key (`id`)
)engine = innodb default charset = utf8mb4 comment = '课程分类';
