#----------------资源表
drop table if exists `resource`;
create table `resource` (
    `id` char(6) not null default '' comment 'id',
    `name` varchar(100) not null comment '名称|菜单或按钮',
    `page` varchar(50) null comment '页面|路由',
    `request` varchar(200) null comment '请求|接口',
    `parent` char(6) comment '父id',
    primary key (`id`)
)engine = innodb default charset=utf8 comment='资源';

insert into `resource` value ('01','系统管理',null,null,null);
insert into `resource` value ('0101','用户管理','/system/user',null,'01');
insert into `resource` value ('010101','保存',null,'["system/admin/user/list","/system/admin/user/save"]','0101');
insert into `resource` value ('010102','删除',null,'["system/admin/user/delete"','0101');
insert into `resource` value ('010103','重置密码',null,'["system/admin/user/save-password"','0101');
insert into `resource` value ('0102','资源管理','/system/resource',null,'01');
insert into `resource` value ('010201','保存/显示',null,'["/system/admin/resource"]','0102');
insert into `resource` value ('0103','角色管理','/system/role',null,'01');
insert into `resource` value ('010301','角色/权限管理',null,'["/system/admin/role"]','0103');