#-------------课程内容文件
drop table if exists `course_content_file`;
create table `course_content_file`(
    `id` char(8) not null default '' comment 'id',
    `course_id` char(8) not null comment '课程id',
    `url` varchar(100) comment '地址',
    `name` varchar(100) comment '文件名',
    `size` int comment '大小|字节b',
    primary key (`id`)
)engine=innodb default charset=utf8mb4 comment '课程内容文件';