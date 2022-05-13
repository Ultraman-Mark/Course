#---------------- 职位-资源关联表
drop table if exists `role_resource`;
create table `role_resource`(
    `id` char(8) not null default '' comment 'id',
    `role_id` char(8) not null comment '角色|id',
    `resource_id` char(8) not null comment '资源|id',
    primary key (`id`)
)engine=innodb  default charset=utf8mb4 comment='角色资源关联';

insert into `role_resource` values ('00000000','00000000','01');
insert into `role_resource` values ('00000001','00000000','0101');
insert into `role_resource` values ('00000002','00000000','010101');
insert into `role_resource` values ('00000003','00000000','010102');
insert into `role_resource` values ('00000004','00000000','010103');
insert into `role_resource` values ('00000005','00000000','0102');
insert into `role_resource` values ('00000006','00000000','010201');
insert into `role_resource` values ('00000007','00000000','0103');
insert into `role_resource` values ('00000008','00000000','010301');