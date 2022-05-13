#-------------文件
drop table if exists `file`;
create table `file`(
   `id` char(8) not null default '' comment 'id',
   `path` varchar(100) not null comment '相对路径',
   `name` varchar(100) comment '文件名',
   `suffix` varchar(10) comment '后缀',
   `size` int comment '大小|字节B',
   `use` char(1) comment '用途|枚举[FileUseEnum]: COURSE("C","课程"),TEACHER("T","教师")',
   `created_at` datetime(3) comment '创建时间',
   `updated_at` datetime(3) comment '修改时间',
   primary key (`id`),
   unique key `path_unique` (`path`)
)engine = innodb default charset=utf8mb4 comment = '文件';

alter table `file` add column (`shard_index` int comment  '已上传分片');
alter table `file` add column (`shard_size` int comment  '分片大小|B');
alter table `file` add column (`shard_total` int comment  '分片总数');
alter table `file` add column (`key` varchar(32) comment  '文件标识');
alter table `file` add  unique key key_unique(`key`);

alter table `file` add column (`vod` char(32) comment 'vod|阿里云vod');