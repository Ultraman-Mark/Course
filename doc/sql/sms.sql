#---------------- 短信验证码
drop table if exists `sms`;
create table `sms`(
    `id` char(8) not null default '' comment 'id',
    `mobile` varchar(50) not null comment '手机号',
    `code` char(6) not null comment '验证码',
    `use` char(1) not null comment '用途|枚举[SmsUseEnum]:REGISTER("R","注册"),FORGET("F","忘记密码")',
    `at` datetime not null comment '生成时间',
    `status` char(1) not null comment '用途|枚举[SmsStatusEnum]:USED("U","已使用"),NOT_USED("N","未使用")',
    primary key (`id`)
)engine=innodb default charset=utf8mb4 comment='短信验证码';

INSERT INTO `sms`(`id`, `mobile`, `code`, `use`, `at`, `status`)
VALUES ('7oPPcfYq', '12345678901', '225872', 'F', '2000-01-01 12:00:00', 'N');