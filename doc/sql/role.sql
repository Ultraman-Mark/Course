#----------------角色表
drop table if exists `role`;
create table `role`(
    `id` char(8) not null default '' comment 'id',
    `name` varchar(50) not null comment '角色',
    `desc` varchar(100) not null comment '描述',
    primary key (`id`)
)engine=innodb default charset=utf8mb4 comment='角色';

insert into `role` values ('00000000','系统管理员','管理用户、角色权限');
insert into `role` values ('00000001','开发','维护资源');
insert into `role` values ('00000002','业务管理员','负责业务管理');