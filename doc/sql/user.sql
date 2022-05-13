#----------------用户
drop table if exists `user`;
create table `user` (
    `id` char(8) not null default '' comment 'id',
    `login_name` varchar(50) not null comment '登录名',
    `name` varchar(50) comment '昵称',
    `password` char(32) not null comment '密码',
    primary key (`id`),
    unique key `login_name_unique` (`login_name`)
) engine = innodb default charset = utf8mb4 comment '用户';
insert into `user` (id, login_name, name, password) VALUES ('10000000','test','测试','202cb962ac59075b964b07152d234b70');