#----------课程
drop table if exists `course`;
create table `course`(
     id char(8) not null default '' comment 'id',
     name varchar(50) not null comment '名称',
     summary varchar(2000) comment '概述',
     time int default 0 comment '时长|单位秒',
     price decimal(8,2) default 0.00 comment '价格(元)',
     image varchar(100) comment '封面',
     level char(1)  comment '级别|枚举[CourseLevelEnum]: ONE("1","初级"),TWO("2","中级"),THREE("3","高级")',
     charge char(1) comment '收费|枚举[CourseChargeEnum]: CHARGE("C","收费"),FREE("F","免费")',
     status char(1) comment '状态|枚举[CourseStatusEnum]: PUBLISH("P","发布"),DRAFT("D","草稿")',
     enroll integer default 0 comment '报名数',
     sort int comment '顺序',
     created_at datetime(3) comment '创建时间',
     updated_at datetime(3) comment '修改时间',
     primary key (id)
)engine=innodb default charset = utf8mb4 comment = '课程表';

insert into course (id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
values ('00000001','测试课程01','这是一门测试课程',7200,19.9,'',1,'C','P',100,0,now(),now());

alter table `course` add column (`teacher_id` char(8) comment '讲师|teacher.id');
alter table `course` add column (`number` int comment '购买人数');
