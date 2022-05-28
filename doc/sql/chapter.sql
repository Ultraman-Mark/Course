#------------章节
drop table if exists `chapter`;
create table `chapter`(
    `id` char(8) not null comment 'ID',
    `course_id` char(8) comment '课程ID',
    `name` varchar(50) comment '名称',
    primary key (`id`)
) engine = innodb default charset = utf8mb4 comment '大章';

insert into `chapter` (id, course_id, name) value ('00000001','00000000','测试大章01');
insert into `chapter` (id, course_id, name) VALUE ('00000002','00000000','测试大章02');
insert into `chapter` (id, course_id, name) value ('00000003','00000000','测试大章03');
insert into `chapter` (id, course_id, name) VALUE ('00000004','00000000','测试大章04');
insert into `chapter` (id, course_id, name) value ('00000005','00000000','测试大章05');
insert into `chapter` (id, course_id, name) VALUE ('00000006','00000000','测试大章06');
insert into `chapter` (id, course_id, name) value ('00000007','00000000','测试大章07');
insert into `chapter` (id, course_id, name) VALUE ('00000008','00000000','测试大章08');
insert into `chapter` (id, course_id, name) value ('00000009','00000000','测试大章09');
insert into `chapter` (id, course_id, name) VALUE ('00000010','00000000','测试大章10');
insert into `chapter` (id, course_id, name) VALUE ('00000011','00000000','测试大章11');
insert into `chapter` (id, course_id, name) VALUE ('00000012','00000000','测试大章12');
insert into `chapter` (id, course_id, name) VALUE ('00000013','00000000','测试大章13');
insert into `chapter` (id, course_id, name) VALUE ('00000014','00000000','测试大章14');
