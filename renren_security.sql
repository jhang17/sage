/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : renren_security

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2018-06-03 11:48:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-Q4UTI671527996237415', '1527997713945', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1527561000000', '-1', '5', 'PAUSED', 'CRON', '1527559625000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1527561000000', '-1', '5', 'PAUSED', 'CRON', '1527559625000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '人人开源集团', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '长沙分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', '0');
INSERT INTO `sys_dept` VALUES ('6', '0', '德稻集团', '0', '0');
INSERT INTO `sys_dept` VALUES ('7', '6', '平台架构', '0', '0');
INSERT INTO `sys_dept` VALUES ('8', '7', '莫部开发', '0', '0');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"测试\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26],\"deptIdList\":[4],\"createTime\":\"May 29, 2018 10:09:02 AM\"}', '317', '0:0:0:0:0:0:0:1', '2018-05-29 10:09:03');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"test\",\"password\":\"114a362bd34216c7b7ba2d5baee4645b01917e6161a7b93d9a006a7e7b9d8b2e\",\"salt\":\"vSdW7iCHmCRUZXO5viZZ\",\"email\":\"123456@qq.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:10:09 AM\",\"deptId\":4,\"deptName\":\"技术部\"}', '128', '0:0:0:0:0:0:0:1', '2018-05-29 10:10:10');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"xujh\",\"password\":\"264bfc57833b326cb06a671934eeb1b1a3f887a8d05515d9d23b024ef6619297\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:14:38 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '75', '0:0:0:0:0:0:0:1', '2018-05-29 10:14:39');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"德稻平台架构部门\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,32,33,34,35],\"deptIdList\":[7,8],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '61', '0:0:0:0:0:0:0:1', '2018-05-29 10:16:39');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"xujh\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"May 29, 2018 10:14:39 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '74', '0:0:0:0:0:0:0:1', '2018-05-29 10:17:07');
INSERT INTO `sys_log` VALUES ('6', 'xujh', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"生部开发\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,32,33,34,35],\"deptIdList\":[8],\"createTime\":\"May 29, 2018 10:18:32 AM\"}', '73', '0:0:0:0:0:0:0:1', '2018-05-29 10:18:33');
INSERT INTO `sys_log` VALUES ('7', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[1]', '82', '0:0:0:0:0:0:0:1', '2018-05-29 10:22:47');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":41,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"报工管理\",\"type\":0,\"icon\":\"fa fa-envelope-open-o\",\"orderNum\":0}', '177', '0:0:0:0:0:0:0:1', '2018-05-29 10:30:43');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":42,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"日报管理\",\"url\":\"11\",\"type\":1,\"icon\":\"fa fa-envelope-open\",\"orderNum\":0}', '121', '0:0:0:0:0:0:0:1', '2018-05-29 10:31:32');
INSERT INTO `sys_log` VALUES ('10', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '42', '92', '0:0:0:0:0:0:0:1', '2018-05-29 10:50:37');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":43,\"parentId\":41,\"parentName\":\"报工管理\",\"name\":\"日报管理\",\"url\":\"work/workdaily/workdaily.html\",\"type\":1,\"orderNum\":0}', '46', '0:0:0:0:0:0:0:1', '2018-05-29 10:51:23');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":44,\"parentId\":43,\"parentName\":\"日报管理\",\"name\":\"新增\",\"perms\":\"work:workdaily:save\",\"type\":2,\"orderNum\":0}', '96', '0:0:0:0:0:0:0:1', '2018-05-29 10:53:04');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":45,\"parentId\":43,\"parentName\":\"日报管理\",\"name\":\"修改\",\"perms\":\"work:workdaily:update\",\"type\":2,\"orderNum\":0}', '75', '0:0:0:0:0:0:0:1', '2018-05-29 10:53:33');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":46,\"parentId\":43,\"parentName\":\"日报管理\",\"name\":\"删除\",\"perms\":\"work:workdaily:delete\",\"type\":2,\"orderNum\":0}', '53', '0:0:0:0:0:0:0:1', '2018-05-29 10:53:55');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":47,\"parentId\":43,\"parentName\":\"日报管理\",\"name\":\"查看\",\"perms\":\"work:workdaily:list\",\"type\":2,\"orderNum\":0}', '45', '0:0:0:0:0:0:0:1', '2018-05-29 10:54:40');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":43,\"parentId\":41,\"parentName\":\"报工管理\",\"name\":\"日报管理\",\"url\":\"modules/work/workdaily/workdaily.html\",\"type\":1,\"orderNum\":0}', '49', '0:0:0:0:0:0:0:1', '2018-05-29 10:56:35');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"德稻平台架构部门\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[1,2,3,4,5,7,8],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '225', '0:0:0:0:0:0:0:1', '2018-05-29 10:58:58');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"test\",\"salt\":\"vSdW7iCHmCRUZXO5viZZ\",\"email\":\"123456@qq.com\",\"mobile\":\"1888111\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:10:10 AM\",\"deptId\":4,\"deptName\":\"技术部\"}', '168', '0:0:0:0:0:0:0:1', '2018-05-29 11:12:34');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '152', '0:0:0:0:0:0:0:1', '2018-05-29 15:25:31');
INSERT INTO `sys_log` VALUES ('20', 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[3]', '64', '0:0:0:0:0:0:0:1', '2018-05-29 15:25:39');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"德稻平台架构部门\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,3,19,20,21,22,4,23,24,25,26,5,27,29,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[1,2,3,4,5,7,8],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '71', '0:0:0:0:0:0:0:1', '2018-05-29 15:26:15');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":4,\"username\":\"mazt\",\"password\":\"e901cb28b766f93f0bd5ae737d7eed810692dafdf74400168dcc2c7f432edbae\",\"salt\":\"XtCMjDZxRTg1I00BeZMi\",\"email\":\"111@qq.com\",\"mobile\":\"15812221154\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"May 29, 2018 3:27:13 PM\",\"deptId\":6,\"deptName\":\"德稻集团\"}', '129', '0:0:0:0:0:0:0:1', '2018-05-29 15:27:13');
INSERT INTO `sys_log` VALUES ('23', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[2]', '62', '0:0:0:0:0:0:0:1', '2018-05-29 15:27:21');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":5,\"username\":\"liwj\",\"password\":\"398eaa904fce0a1804ae9a26933ee3ab971cd051c88a41d1a8a7f32ddbda682c\",\"salt\":\"gR2rLdCWd3GdMQCKDHNK\",\"email\":\"788@qq.com\",\"mobile\":\"13854875548\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 3:27:59 PM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '73', '0:0:0:0:0:0:0:1', '2018-05-29 15:27:59');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"xujh\",\"password\":\"264bfc57833b326cb06a671934eeb1b1a3f887a8d05515d9d23b024ef6619297\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[2,1],\"createTime\":\"May 29, 2018 10:14:39 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '41', '0:0:0:0:0:0:0:1', '2018-05-29 15:28:16');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"xujh\",\"password\":\"264bfc57833b326cb06a671934eeb1b1a3f887a8d05515d9d23b024ef6619297\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:14:39 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '53', '0:0:0:0:0:0:0:1', '2018-05-29 15:28:25');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '128', '0:0:0:0:0:0:0:1', '2018-05-29 15:32:50');
INSERT INTO `sys_log` VALUES ('28', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"德稻平台架构部门\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,3,19,20,21,22,4,23,24,25,26,5,27,29,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '79', '0:0:0:0:0:0:0:1', '2018-05-29 15:36:19');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"xujh\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:14:39 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '88', '0:0:0:0:0:0:0:1', '2018-05-29 15:40:17');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"组长\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,3,19,20,21,22,4,23,24,25,26,5,27,29,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[4,5,6,7],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '73', '0:0:0:0:0:0:0:1', '2018-05-29 15:40:50');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '89', '0:0:0:0:0:0:0:1', '2018-05-29 15:40:59');
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '172', '0:0:0:0:0:0:0:1', '2018-05-29 15:46:58');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"xujh\",\"salt\":\"YudaNIduTZqFQMhVzrvJ\",\"email\":\"122222@qq.com\",\"mobile\":\"1999999999\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 10:14:39 AM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '312', '0:0:0:0:0:0:0:1', '2018-05-29 15:47:17');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":5,\"username\":\"liwj\",\"password\":\"398eaa904fce0a1804ae9a26933ee3ab971cd051c88a41d1a8a7f32ddbda682c\",\"salt\":\"gR2rLdCWd3GdMQCKDHNK\",\"email\":\"788@qq.com\",\"mobile\":\"13854875548\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 3:27:59 PM\",\"deptId\":8,\"deptName\":\"莫部开发\"}', '102', '0:0:0:0:0:0:0:1', '2018-05-29 15:47:32');
INSERT INTO `sys_log` VALUES ('35', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,3,19,20,21,22,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '164', '0:0:0:0:0:0:0:1', '2018-05-29 15:54:15');
INSERT INTO `sys_log` VALUES ('36', 'mazt', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"11\",\"remark\":\"11\",\"deptId\":8,\"deptName\":\"莫部开发\",\"menuIdList\":[],\"deptIdList\":[],\"createTime\":\"May 29, 2018 3:55:42 PM\"}', '39', '0:0:0:0:0:0:0:1', '2018-05-29 15:55:42');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":6,\"username\":\"yaoyb\",\"password\":\"a8122b5fb7a88d03cf02e3a68eb6ba9c81e02862a0ccd73ecaae81b5d283e2ac\",\"salt\":\"lv8tRR76maLLdCJJ9peK\",\"email\":\"111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 3:57:07 PM\",\"deptId\":2,\"deptName\":\"长沙分公司\"}', '67', '0:0:0:0:0:0:0:1', '2018-05-29 15:57:08');
INSERT INTO `sys_log` VALUES ('38', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":6,\"username\":\"yaoyb\",\"password\":\"a8122b5fb7a88d03cf02e3a68eb6ba9c81e02862a0ccd73ecaae81b5d283e2ac\",\"salt\":\"lv8tRR76maLLdCJJ9peK\",\"email\":\"111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 3:57:08 PM\",\"deptId\":3,\"deptName\":\"上海分公司\"}', '98', '0:0:0:0:0:0:0:1', '2018-05-29 15:58:38');
INSERT INTO `sys_log` VALUES ('39', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '85', '0:0:0:0:0:0:0:1', '2018-05-29 16:00:25');
INSERT INTO `sys_log` VALUES ('40', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '89', '0:0:0:0:0:0:0:1', '2018-05-29 16:03:16');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":5,\"roleName\":\"上海人人总裁\",\"remark\":\"人人集团最高权限\",\"deptId\":1,\"deptName\":\"人人开源集团\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,48,49,50,51,52,41,43,44,45,46,47],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"May 29, 2018 4:04:15 PM\"}', '101', '0:0:0:0:0:0:0:1', '2018-05-29 16:04:16');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":7,\"username\":\"test\",\"password\":\"9e3fda1ec9cacade39b8ea08bac84445a4759d30aff579317fcd32e43a23151b\",\"salt\":\"dpSARkibJK7JIPLM01mi\",\"email\":\"123456@qq.com\",\"mobile\":\"19945678521\",\"status\":1,\"roleIdList\":[5],\"createTime\":\"May 29, 2018 4:05:10 PM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '67', '0:0:0:0:0:0:0:1', '2018-05-29 16:05:11');
INSERT INTO `sys_log` VALUES ('43', 'test', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":8,\"username\":\"wangwu\",\"password\":\"59df3dea9f4ad8f1756b2a77657ac05b4caaf72d6ca0c013cc268e6f10a309dc\",\"salt\":\"RJ5PCxAadp96t6ExH5t6\",\"email\":\"2121@qq.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[],\"createTime\":\"May 29, 2018 4:06:27 PM\",\"deptId\":3,\"deptName\":\"上海分公司\"}', '34', '0:0:0:0:0:0:0:1', '2018-05-29 16:06:28');
INSERT INTO `sys_log` VALUES ('44', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"组长\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,27,29,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[4,5,6,7,8],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '88', '0:0:0:0:0:0:0:1', '2018-05-29 16:07:59');
INSERT INTO `sys_log` VALUES ('45', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '180', '0:0:0:0:0:0:0:1', '2018-05-29 16:26:20');
INSERT INTO `sys_log` VALUES ('46', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"组长\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,27,29,31,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[6,7,8],\"createTime\":\"May 29, 2018 10:16:39 AM\"}', '179', '0:0:0:0:0:0:0:1', '2018-05-29 16:50:42');
INSERT INTO `sys_log` VALUES ('47', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"mazt\",\"password\":\"e901cb28b766f93f0bd5ae737d7eed810692dafdf74400168dcc2c7f432edbae\",\"salt\":\"XtCMjDZxRTg1I00BeZMi\",\"email\":\"111@qq.com\",\"mobile\":\"15812221154\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"May 29, 2018 3:27:13 PM\",\"deptId\":6,\"deptName\":\"德稻集团\"}', '101', '0:0:0:0:0:0:0:1', '2018-05-29 16:51:08');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '214', '0:0:0:0:0:0:0:1', '2018-05-29 16:58:05');
INSERT INTO `sys_log` VALUES ('49', 'mazt', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":9,\"username\":\"lip\",\"password\":\"fa6476c5b5b94f5cca74faf3ef7c2ffe80d6bbd643b66f1157446d36e25fa0ea\",\"salt\":\"otNrxe3BDNRdByKKYM2B\",\"email\":\"797979@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"May 29, 2018 5:02:13 PM\",\"deptId\":7,\"deptName\":\"平台架构\"}', '205', '0:0:0:0:0:0:0:1', '2018-05-29 17:02:14');
INSERT INTO `sys_log` VALUES ('50', 'mazt', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '80', '0:0:0:0:0:0:0:1', '2018-05-29 17:06:24');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,46,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '211', '0:0:0:0:0:0:0:1', '2018-06-01 13:14:06');
INSERT INTO `sys_log` VALUES ('52', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":47,\"parentId\":43,\"parentName\":\"日报管理\",\"name\":\"查看\",\"perms\":\"work:workdaily:list,work:workdaily:info\",\"type\":2,\"orderNum\":0}', '46', '0:0:0:0:0:0:0:1', '2018-06-01 13:16:15');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,45,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '86', '0:0:0:0:0:0:0:1', '2018-06-01 13:17:28');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,36,37,38,39,40,41,43,44,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '93', '0:0:0:0:0:0:0:1', '2018-06-01 16:02:22');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":53,\"parentId\":41,\"parentName\":\"报工管理\",\"name\":\"周报管理\",\"url\":\"121\",\"perms\":\"21\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-06-03 09:42:08');
INSERT INTO `sys_log` VALUES ('56', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '53', '21', '0:0:0:0:0:0:0:1', '2018-06-03 09:42:47');
INSERT INTO `sys_log` VALUES ('57', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,3,19,20,21,22,36,37,38,39,40,41,43,44,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '53', '0:0:0:0:0:0:0:1', '2018-06-03 10:48:15');
INSERT INTO `sys_log` VALUES ('58', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,3,19,20,21,22,36,37,38,39,40,41,43,44,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '18', '0:0:0:0:0:0:0:1', '2018-06-03 10:50:40');
INSERT INTO `sys_log` VALUES ('59', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,31,32,33,34,35,36,37,41,43,44,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '15', '0:0:0:0:0:0:0:1', '2018-06-03 10:52:51');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,31,32,33,34,35,36,37,41,43,44,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '14', '0:0:0:0:0:0:0:1', '2018-06-03 10:56:00');
INSERT INTO `sys_log` VALUES ('61', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,31,32,36,37,41,43,44,47],\"deptIdList\":[],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '13', '0:0:0:0:0:0:0:1', '2018-06-03 10:56:14');
INSERT INTO `sys_log` VALUES ('62', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"普通员工\",\"remark\":\"普通权限\",\"deptId\":7,\"deptName\":\"平台架构\",\"menuIdList\":[1,31,32,36,37,41,43,44,47],\"deptIdList\":[7],\"createTime\":\"May 29, 2018 10:09:03 AM\"}', '14', '0:0:0:0:0:0:0:1', '2018-06-03 10:58:19');
INSERT INTO `sys_log` VALUES ('63', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":54,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"数据接口\",\"type\":0,\"icon\":\"fa fa-bar-chart\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-03 11:04:36');
INSERT INTO `sys_log` VALUES ('64', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":55,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"swagger\",\"url\":\"swagger-ui.html\",\"type\":1,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-03 11:05:15');
INSERT INTO `sys_log` VALUES ('65', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":55,\"parentId\":54,\"parentName\":\"数据接口\",\"name\":\"swagger\",\"url\":\"swagger-ui.html\",\"type\":1,\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2018-06-03 11:05:47');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '0', '报工管理', null, null, '0', 'fa fa-envelope-open-o', '0');
INSERT INTO `sys_menu` VALUES ('43', '41', '日报管理', 'modules/work/workdaily.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '43', '新增', null, 'work:workdaily:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '43', '修改', null, 'work:workdaily:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '43', '删除', null, 'work:workdaily:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '43', '查看', null, 'work:workdaily:list,work:workdaily:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '0', '数据接口', null, null, '0', 'fa fa-bar-chart', '0');
INSERT INTO `sys_menu` VALUES ('55', '54', 'swagger', 'swagger-ui.html', null, '1', null, '0');

-- ----------------------------
-- Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '普通员工', '普通权限', '7', '2018-05-29 10:09:03');
INSERT INTO `sys_role` VALUES ('2', '组长', null, '7', '2018-05-29 10:16:39');
INSERT INTO `sys_role` VALUES ('4', '11', '11', '8', '2018-05-29 15:55:42');
INSERT INTO `sys_role` VALUES ('5', '上海人人总裁', '人人集团最高权限', '1', '2018-05-29 16:04:16');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('32', '5', '1');
INSERT INTO `sys_role_dept` VALUES ('33', '5', '2');
INSERT INTO `sys_role_dept` VALUES ('34', '5', '3');
INSERT INTO `sys_role_dept` VALUES ('35', '5', '4');
INSERT INTO `sys_role_dept` VALUES ('36', '5', '5');
INSERT INTO `sys_role_dept` VALUES ('43', '2', '6');
INSERT INTO `sys_role_dept` VALUES ('44', '2', '7');
INSERT INTO `sys_role_dept` VALUES ('45', '2', '8');
INSERT INTO `sys_role_dept` VALUES ('48', '1', '7');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('297', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('298', '5', '2');
INSERT INTO `sys_role_menu` VALUES ('299', '5', '15');
INSERT INTO `sys_role_menu` VALUES ('300', '5', '16');
INSERT INTO `sys_role_menu` VALUES ('301', '5', '17');
INSERT INTO `sys_role_menu` VALUES ('302', '5', '18');
INSERT INTO `sys_role_menu` VALUES ('303', '5', '3');
INSERT INTO `sys_role_menu` VALUES ('304', '5', '19');
INSERT INTO `sys_role_menu` VALUES ('305', '5', '20');
INSERT INTO `sys_role_menu` VALUES ('306', '5', '21');
INSERT INTO `sys_role_menu` VALUES ('307', '5', '22');
INSERT INTO `sys_role_menu` VALUES ('308', '5', '4');
INSERT INTO `sys_role_menu` VALUES ('309', '5', '23');
INSERT INTO `sys_role_menu` VALUES ('310', '5', '24');
INSERT INTO `sys_role_menu` VALUES ('311', '5', '25');
INSERT INTO `sys_role_menu` VALUES ('312', '5', '26');
INSERT INTO `sys_role_menu` VALUES ('313', '5', '5');
INSERT INTO `sys_role_menu` VALUES ('314', '5', '6');
INSERT INTO `sys_role_menu` VALUES ('315', '5', '7');
INSERT INTO `sys_role_menu` VALUES ('316', '5', '8');
INSERT INTO `sys_role_menu` VALUES ('317', '5', '9');
INSERT INTO `sys_role_menu` VALUES ('318', '5', '10');
INSERT INTO `sys_role_menu` VALUES ('319', '5', '11');
INSERT INTO `sys_role_menu` VALUES ('320', '5', '12');
INSERT INTO `sys_role_menu` VALUES ('321', '5', '13');
INSERT INTO `sys_role_menu` VALUES ('322', '5', '14');
INSERT INTO `sys_role_menu` VALUES ('323', '5', '27');
INSERT INTO `sys_role_menu` VALUES ('324', '5', '29');
INSERT INTO `sys_role_menu` VALUES ('325', '5', '30');
INSERT INTO `sys_role_menu` VALUES ('326', '5', '31');
INSERT INTO `sys_role_menu` VALUES ('327', '5', '32');
INSERT INTO `sys_role_menu` VALUES ('328', '5', '33');
INSERT INTO `sys_role_menu` VALUES ('329', '5', '34');
INSERT INTO `sys_role_menu` VALUES ('330', '5', '35');
INSERT INTO `sys_role_menu` VALUES ('331', '5', '36');
INSERT INTO `sys_role_menu` VALUES ('332', '5', '37');
INSERT INTO `sys_role_menu` VALUES ('333', '5', '38');
INSERT INTO `sys_role_menu` VALUES ('334', '5', '39');
INSERT INTO `sys_role_menu` VALUES ('335', '5', '40');
INSERT INTO `sys_role_menu` VALUES ('336', '5', '48');
INSERT INTO `sys_role_menu` VALUES ('337', '5', '49');
INSERT INTO `sys_role_menu` VALUES ('338', '5', '50');
INSERT INTO `sys_role_menu` VALUES ('339', '5', '51');
INSERT INTO `sys_role_menu` VALUES ('340', '5', '52');
INSERT INTO `sys_role_menu` VALUES ('341', '5', '41');
INSERT INTO `sys_role_menu` VALUES ('342', '5', '43');
INSERT INTO `sys_role_menu` VALUES ('343', '5', '44');
INSERT INTO `sys_role_menu` VALUES ('344', '5', '45');
INSERT INTO `sys_role_menu` VALUES ('345', '5', '46');
INSERT INTO `sys_role_menu` VALUES ('346', '5', '47');
INSERT INTO `sys_role_menu` VALUES ('403', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('404', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('405', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('406', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('407', '2', '17');
INSERT INTO `sys_role_menu` VALUES ('408', '2', '18');
INSERT INTO `sys_role_menu` VALUES ('409', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('410', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('411', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('412', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('413', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('414', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('415', '2', '23');
INSERT INTO `sys_role_menu` VALUES ('416', '2', '24');
INSERT INTO `sys_role_menu` VALUES ('417', '2', '25');
INSERT INTO `sys_role_menu` VALUES ('418', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('419', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('420', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('421', '2', '29');
INSERT INTO `sys_role_menu` VALUES ('422', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('423', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('424', '2', '33');
INSERT INTO `sys_role_menu` VALUES ('425', '2', '34');
INSERT INTO `sys_role_menu` VALUES ('426', '2', '35');
INSERT INTO `sys_role_menu` VALUES ('427', '2', '36');
INSERT INTO `sys_role_menu` VALUES ('428', '2', '37');
INSERT INTO `sys_role_menu` VALUES ('429', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('430', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('431', '2', '40');
INSERT INTO `sys_role_menu` VALUES ('432', '2', '41');
INSERT INTO `sys_role_menu` VALUES ('433', '2', '43');
INSERT INTO `sys_role_menu` VALUES ('434', '2', '44');
INSERT INTO `sys_role_menu` VALUES ('435', '2', '45');
INSERT INTO `sys_role_menu` VALUES ('436', '2', '46');
INSERT INTO `sys_role_menu` VALUES ('437', '2', '47');
INSERT INTO `sys_role_menu` VALUES ('566', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('567', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('568', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('569', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('570', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('571', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('572', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('573', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('574', '1', '47');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('3', 'xujh', '264bfc57833b326cb06a671934eeb1b1a3f887a8d05515d9d23b024ef6619297', 'YudaNIduTZqFQMhVzrvJ', '122222@qq.com', '1999999999', '1', '7', '2018-05-29 10:14:39');
INSERT INTO `sys_user` VALUES ('4', 'mazt', 'e901cb28b766f93f0bd5ae737d7eed810692dafdf74400168dcc2c7f432edbae', 'XtCMjDZxRTg1I00BeZMi', '111@qq.com', '15812221154', '1', '6', '2018-05-29 15:27:13');
INSERT INTO `sys_user` VALUES ('5', 'liwj', '398eaa904fce0a1804ae9a26933ee3ab971cd051c88a41d1a8a7f32ddbda682c', 'gR2rLdCWd3GdMQCKDHNK', '788@qq.com', '13854875548', '1', '8', '2018-05-29 15:27:59');
INSERT INTO `sys_user` VALUES ('6', 'yaoyb', 'a8122b5fb7a88d03cf02e3a68eb6ba9c81e02862a0ccd73ecaae81b5d283e2ac', 'lv8tRR76maLLdCJJ9peK', '111@qq.com', '11111111111', '1', '3', '2018-05-29 15:57:08');
INSERT INTO `sys_user` VALUES ('7', 'test', '9e3fda1ec9cacade39b8ea08bac84445a4759d30aff579317fcd32e43a23151b', 'dpSARkibJK7JIPLM01mi', '123456@qq.com', '19945678521', '1', '1', '2018-05-29 16:05:11');
INSERT INTO `sys_user` VALUES ('8', 'wangwu', '59df3dea9f4ad8f1756b2a77657ac05b4caaf72d6ca0c013cc268e6f10a309dc', 'RJ5PCxAadp96t6ExH5t6', '2121@qq.com', '18888888888', '1', '3', '2018-05-29 16:06:28');
INSERT INTO `sys_user` VALUES ('9', 'lip', 'fa6476c5b5b94f5cca74faf3ef7c2ffe80d6bbd643b66f1157446d36e25fa0ea', 'otNrxe3BDNRdByKKYM2B', '797979@qq.com', '15111111111', '1', '7', '2018-05-29 17:02:14');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('4', '2', '1');
INSERT INTO `sys_user_role` VALUES ('11', '3', '1');
INSERT INTO `sys_user_role` VALUES ('12', '5', '1');
INSERT INTO `sys_user_role` VALUES ('14', '6', '1');
INSERT INTO `sys_user_role` VALUES ('15', '7', '5');
INSERT INTO `sys_user_role` VALUES ('16', '4', '2');
INSERT INTO `sys_user_role` VALUES ('17', '9', '1');

-- ----------------------------
-- Table structure for `work_daily`
-- ----------------------------
DROP TABLE IF EXISTS `work_daily`;
CREATE TABLE `work_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `work_date` date DEFAULT NULL COMMENT '工作日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `plan_task` varchar(500) DEFAULT NULL COMMENT '计划任务',
  `actual_task` varchar(500) DEFAULT NULL COMMENT '实际任务',
  `work_summary` varchar(500) DEFAULT NULL COMMENT '工作总结',
  `problem` varchar(500) DEFAULT NULL COMMENT '问题',
  `tomorrow_plan` varchar(500) DEFAULT NULL COMMENT '明天计划',
  `advise` varchar(500) DEFAULT NULL COMMENT '工作建议',
  `user_id` int(50) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(30) DEFAULT NULL COMMENT '创建者名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_daily
-- ----------------------------
INSERT INTO `work_daily` VALUES ('17', '文采张', '2018-06-02', '7', 'wq', '大叔大婶', '分手大师', '分手大师', '分手大师', '带我去', '1', '2018-06-02 10:43:18', null);
INSERT INTO `work_daily` VALUES ('24', '许建行', '2018-06-02', '6', '计划任务', '实际任务', '工作总结', '问题', '明天计划', '工作建议', '1', '2018-06-03 10:43:49', null);
INSERT INTO `work_daily` VALUES ('25', '23', '2018-06-06', '7', '32', '32', '32', '32', '32', '32', '3', '2018-06-03 10:53:35', null);
INSERT INTO `work_daily` VALUES ('26', 'asa', '2018-06-07', '7', 'sa', 'sa', 'sa', 'sa', 'sa', 'sa', '4', '2018-06-03 10:55:17', null);
INSERT INTO `work_daily` VALUES ('27', 'sa', '2018-06-01', '8', 'sa', 'sa', 'sa', 'sa', 'sa', 'sa', '3', '2018-06-03 10:57:05', null);
