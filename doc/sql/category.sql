#---------分类
drop table if exists `category`;
create table `category`(
   `id` char(8) not null default '' comment 'id',
   `parent` char(8) not null default '' comment '父id',
   `name` varchar(50) not null comment '名称',
   `sort`int comment '顺序',
   primary key (`id`)
)engine = innodb default charset=utf8mb4 comment = '分类';

insert into `category` (id, parent, name, sort) VALUES ('00000100','00000000','前端技术',100);
insert into `category` (id, parent, name, sort) VALUES ('00000101','00000100','html/css',101);
insert into `category` (id, parent, name, sort) VALUES ('00000102','00000100','javascript',102);
insert into `category` (id, parent, name, sort) VALUES ('00000103','00000100','vue.js',103);
insert into `category` (id, parent, name, sort) VALUES ('00000104','00000100','react.js',104);
insert into `category` (id, parent, name, sort) VALUES ('00000105','00000100','angular',105);
insert into `category` (id, parent, name, sort) VALUES ('00000106','00000100','node.js',106);
insert into `category` (id, parent, name, sort) VALUES ('00000107','00000100','jquery',107);
insert into `category` (id, parent, name, sort) VALUES ('00000108','00000100','小程序',108);
insert into `category` (id, parent, name, sort) VALUES ('00000200','00000000','后端技术',200);
insert into `category` (id, parent, name, sort) VALUES ('00000201','00000200','java',201);
insert into `category` (id, parent, name, sort) VALUES ('00000202','00000200','springboot',202);
insert into `category` (id, parent, name, sort) VALUES ('00000203','00000200','springcloud',203);
insert into `category` (id, parent, name, sort) VALUES ('00000204','00000200','ssm',204);
insert into `category` (id, parent, name, sort) VALUES ('00000205','00000200','python',205);
insert into `category` (id, parent, name, sort) VALUES ('00000206','00000200','爬虫',206);
insert into `category` (id, parent, name, sort) VALUES ('00000300','00000000','移动开发',300);
insert into `category` (id, parent, name, sort) VALUES ('00000301','00000300','android',301);
insert into `category` (id, parent, name, sort) VALUES ('00000302','00000300','ios',302);
insert into `category` (id, parent, name, sort) VALUES ('00000303','00000300','react native',303);
insert into `category` (id, parent, name, sort) VALUES ('00000304','00000300','ionic',304);
insert into `category` (id, parent, name, sort) VALUES ('00000400','00000000','前沿技术',400);
insert into `category` (id, parent, name, sort) VALUES ('00000401','00000400','微服务',401);
insert into `category` (id, parent, name, sort) VALUES ('00000402','00000400','区块链',402);
insert into `category` (id, parent, name, sort) VALUES ('00000403','00000400','机器学习',403);
insert into `category` (id, parent, name, sort) VALUES ('00000404','00000400','深度学习',404);
insert into `category` (id, parent, name, sort) VALUES ('00000405','00000400','数据分析&控制',405);
insert into `category` (id, parent, name, sort) VALUES ('00000500','00000000','云计算&大数据',500);
insert into `category` (id, parent, name, sort) VALUES ('00000501','00000500','大数据',501);
insert into `category` (id, parent, name, sort) VALUES ('00000502','00000500','hadoop',502);