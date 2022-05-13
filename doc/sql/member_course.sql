# 会员课程报名
drop table if exists `member_course`;
create table `member_course` (
    `id` char(8) not null default '' comment 'id',
    `member_id` char(8) not null comment '会员id',
    `course_id` char(8) not null comment '课程id',
    `at` datetime(3) not null comment '报名时间',
    primary key (`id`),
    unique key `member_course_unique` (`member_id`,`course_id`)
)engine = innodb default charset=utf8mb4 comment='会员课程报名';