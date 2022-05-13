#-------------讲师
drop table if exists `teacher`;
create table `teacher`(
    `id` char(8) not null default '' comment 'id',
    `name` varchar(50) not null comment '姓名',
    `nickname` varchar(50) comment '昵称',
    `image` varchar(100) comment '头像',
    `position` varchar(50) comment '职业',
    `motto` varchar(50) comment '座右铭',
    `intro` varchar(500) comment '简介',
    primary key (`id`)
) engine = innodb default charset=utf8mb4 comment = '讲师';