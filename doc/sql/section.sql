#----------小节
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`(
    `id` CHAR(8) NOT NULL DEFAULT '' COMMENT 'ID',
    `title` VARCHAR(50) NOT NULL COMMENT '标题',
    `course_id` CHAR(8) COMMENT '课程|course.id',
    `chapter_id` CHAR(8) COMMENT '大章|chapter.id',
    `video` VARCHAR(200) COMMENT '视频',
    `time` INT COMMENT '时长|单位秒',
    `charge` CHAR(1) COMMENT '收费|C 收费; F 免费',
    `sort` INT COMMENT '顺序',
    `created_at` DATETIME(3) COMMENT '创建时间',
    `updated_at` DATETIME(3) COMMENT '修改时间',
    primary key (`id`)
)ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COMMENT = '小节';

ALTER TABLE `section` ADD COLUMN (
    `vod` CHAR(32) COMMENT 'vod|阿里云vod'
);

INSERT INTO `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000001','测试小节01','00000001','00000000','',500,'F',1,now(),now());