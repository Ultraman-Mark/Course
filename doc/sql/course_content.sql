#-------------课程内容
drop table if exists `course_content`;
create table `course_content`(
     `id` char(8) not null default '' comment '课程id',
     `content` mediumtext not null comment '课程内容',
     primary key (`id`)
) engine = innodb default charset = utf8mb4 comment = '课程内容';