#---------------- 职位-角色关联表
drop table if exists `role_user`;
create table `role_user`(
    `id` char(8) not null default '' comment 'id',
    `role_id` char(8) not null comment '角色|id',
    `user_id` char(8) not null comment '用户|id',
    primary key (`id`)
)engine = innodb default charset = utf8mb4 comment = '角色用户关联';

insert into `role_user` values ('00000000','00000000','10000000');