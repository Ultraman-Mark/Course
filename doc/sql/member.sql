#---------------- 会员表
drop table if exists `member`;
create table `member` (
    `id` char(8) not null default '' comment 'id',
    `mobile` varchar(11) not null comment '手机号',
    `password` char(32) not null comment '密码',
    `name` varchar(50) comment '昵称',
    `photo` varchar(200) comment '头像url',
    `register_time` datetime(3) comment '注册时间',
    primary key (`id`),
    unique key `mobile_unique` (`mobile`)
)engine=innodb default charset=utf8mb4 comment '会员';