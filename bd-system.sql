/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.13-log : Database - bd-system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd-system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bd-system`;

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`name`,`order_num`,`del_flag`) values (6,0,'研发部',1,1),(7,6,'研發一部',1,1),(8,6,'研发二部',2,1),(9,0,'销售部',2,1),(10,9,'销售一部',1,1),(11,0,'产品部',3,1),(12,11,'产品一部',1,1),(13,0,'测试部',5,1),(14,13,'测试一部',1,1),(15,13,'测试二部',2,1);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'正常','0','del_flag','删除标记','10',0,1,NULL,1,NULL,NULL,'0'),(3,'显示','1','show_hide','显示/隐藏','10',0,1,NULL,1,NULL,NULL,'0'),(4,'隐藏','0','show_hide','显示/隐藏','20',0,1,NULL,1,NULL,NULL,'0'),(5,'是','1','yes_no','是/否','10',0,1,NULL,1,NULL,NULL,'0'),(6,'否','0','yes_no','是/否','20',0,1,NULL,1,NULL,NULL,'0'),(7,'红色','red','color','颜色值','10',0,1,NULL,1,NULL,NULL,'0'),(8,'绿色','green','color','颜色值','20',0,1,NULL,1,NULL,NULL,'0'),(9,'蓝色','blue','color','颜色值','30',0,1,NULL,1,NULL,NULL,'0'),(10,'黄色','yellow','color','颜色值','40',0,1,NULL,1,NULL,NULL,'0'),(11,'橙色','orange','color','颜色值','50',0,1,NULL,1,NULL,NULL,'0'),(12,'默认主题','default','theme','主题方案','10',0,1,NULL,1,NULL,NULL,'0'),(13,'天蓝主题','cerulean','theme','主题方案','20',0,1,NULL,1,NULL,NULL,'0'),(14,'橙色主题','readable','theme','主题方案','30',0,1,NULL,1,NULL,NULL,'0'),(15,'红色主题','united','theme','主题方案','40',0,1,NULL,1,NULL,NULL,'0'),(16,'Flat主题','flat','theme','主题方案','60',0,1,NULL,1,NULL,NULL,'0'),(17,'国家','1','sys_area_type','区域类型','10',0,1,NULL,1,NULL,NULL,'0'),(18,'省份、直辖市','2','sys_area_type','区域类型','20',0,1,NULL,1,NULL,NULL,'0'),(19,'地市','3','sys_area_type','区域类型','30',0,1,NULL,1,NULL,NULL,'0'),(20,'区县','4','sys_area_type','区域类型','40',0,1,NULL,1,NULL,NULL,'0'),(21,'公司','1','sys_office_type','机构类型','60',0,1,NULL,1,NULL,NULL,'0'),(22,'部门','2','sys_office_type','机构类型','70',0,1,NULL,1,NULL,NULL,'0'),(23,'小组','3','sys_office_type','机构类型','80',0,1,NULL,1,NULL,NULL,'0'),(24,'其它','4','sys_office_type','机构类型','90',0,1,NULL,1,NULL,NULL,'0'),(25,'综合部','1','sys_office_common','快捷通用部门','30',0,1,NULL,1,NULL,NULL,'0'),(26,'开发部','2','sys_office_common','快捷通用部门','40',0,1,NULL,1,NULL,NULL,'0'),(27,'人力部','3','sys_office_common','快捷通用部门','50',0,1,NULL,1,NULL,NULL,'0'),(28,'一级','1','sys_office_grade','机构等级','10',0,1,NULL,1,NULL,NULL,'0'),(29,'二级','2','sys_office_grade','机构等级','20',0,1,NULL,1,NULL,NULL,'0'),(30,'三级','3','sys_office_grade','机构等级','30',0,1,NULL,1,NULL,NULL,'0'),(31,'四级','4','sys_office_grade','机构等级','40',0,1,NULL,1,NULL,NULL,'0'),(32,'所有数据','1','sys_data_scope','数据范围','10',0,1,NULL,1,NULL,NULL,'0'),(33,'所在公司及以下数据','2','sys_data_scope','数据范围','20',0,1,NULL,1,NULL,NULL,'0'),(34,'所在公司数据','3','sys_data_scope','数据范围','30',0,1,NULL,1,NULL,NULL,'0'),(35,'所在部门及以下数据','4','sys_data_scope','数据范围','40',0,1,NULL,1,NULL,NULL,'0'),(36,'所在部门数据','5','sys_data_scope','数据范围','50',0,1,NULL,1,NULL,NULL,'0'),(37,'仅本人数据','8','sys_data_scope','数据范围','90',0,1,NULL,1,NULL,NULL,'0'),(38,'按明细设置','9','sys_data_scope','数据范围','100',0,1,NULL,1,NULL,NULL,'0'),(39,'系统管理','1','sys_user_type','用户类型','10',0,1,NULL,1,NULL,NULL,'0'),(40,'部门经理','2','sys_user_type','用户类型','20',0,1,NULL,1,NULL,NULL,'0'),(41,'普通用户','3','sys_user_type','用户类型','30',0,1,NULL,1,NULL,NULL,'0'),(42,'基础主题','basic','cms_theme','站点主题','10',0,1,NULL,1,NULL,NULL,'0'),(43,'蓝色主题','blue','cms_theme','站点主题','20',0,1,NULL,1,NULL,NULL,'1'),(44,'红色主题','red','cms_theme','站点主题','30',0,1,NULL,1,NULL,NULL,'1'),(45,'文章模型','article','cms_module','栏目模型','10',0,1,NULL,1,NULL,NULL,'0'),(46,'图片模型','picture','cms_module','栏目模型','20',0,1,NULL,1,NULL,NULL,'1'),(47,'下载模型','download','cms_module','栏目模型','30',0,1,NULL,1,NULL,NULL,'1'),(48,'链接模型','link','cms_module','栏目模型','40',0,1,NULL,1,NULL,NULL,'0'),(49,'专题模型','special','cms_module','栏目模型','50',0,1,NULL,1,NULL,NULL,'1'),(50,'默认展现方式','0','cms_show_modes','展现方式','10',0,1,NULL,1,NULL,NULL,'0'),(51,'首栏目内容列表','1','cms_show_modes','展现方式','20',0,1,NULL,1,NULL,NULL,'0'),(52,'栏目第一条内容','2','cms_show_modes','展现方式','30',0,1,NULL,1,NULL,NULL,'0'),(53,'发布','0','cms_del_flag','内容状态','10',0,1,NULL,1,NULL,NULL,'0'),(54,'删除','1','cms_del_flag','内容状态','20',0,1,NULL,1,NULL,NULL,'0'),(55,'审核','2','cms_del_flag','内容状态','15',0,1,NULL,1,NULL,NULL,'0'),(56,'首页焦点图','1','cms_posid','推荐位','10',0,1,NULL,1,NULL,NULL,'0'),(57,'栏目页文章推荐','2','cms_posid','推荐位','20',0,1,NULL,1,NULL,NULL,'0'),(58,'咨询','1','cms_guestbook','留言板分类','10',0,1,NULL,1,NULL,NULL,'0'),(59,'建议','2','cms_guestbook','留言板分类','20',0,1,NULL,1,NULL,NULL,'0'),(60,'投诉','3','cms_guestbook','留言板分类','30',0,1,NULL,1,NULL,NULL,'0'),(61,'其它','4','cms_guestbook','留言板分类','40',0,1,NULL,1,NULL,NULL,'0'),(62,'公休','1','oa_leave_type','请假类型','10',0,1,NULL,1,NULL,NULL,'0'),(63,'病假','2','oa_leave_type','请假类型','20',0,1,NULL,1,NULL,NULL,'0'),(64,'事假','3','oa_leave_type','请假类型','30',0,1,NULL,1,NULL,NULL,'0'),(65,'调休','4','oa_leave_type','请假类型','40',0,1,NULL,1,NULL,NULL,'0'),(66,'婚假','5','oa_leave_type','请假类型','60',0,1,NULL,1,NULL,NULL,'0'),(67,'接入日志','1','sys_log_type','日志类型','30',0,1,NULL,1,NULL,NULL,'0'),(68,'异常日志','2','sys_log_type','日志类型','40',0,1,NULL,1,NULL,NULL,'0'),(69,'请假流程','leave','act_type','流程类型','10',0,1,NULL,1,NULL,NULL,'0'),(70,'审批测试流程','test_audit','act_type','流程类型','20',0,1,NULL,1,NULL,NULL,'0'),(71,'分类1','1','act_category','流程分类','10',0,1,NULL,1,NULL,NULL,'0'),(72,'分类2','2','act_category','流程分类','20',0,1,NULL,1,NULL,NULL,'0'),(73,'增删改查','crud','gen_category','代码生成分类','10',0,1,NULL,1,NULL,NULL,'1'),(74,'增删改查（包含从表）','crud_many','gen_category','代码生成分类','20',0,1,NULL,1,NULL,NULL,'1'),(75,'树结构','tree','gen_category','代码生成分类','30',0,1,NULL,1,NULL,NULL,'1'),(76,'=','=','gen_query_type','查询方式','10',0,1,NULL,1,NULL,NULL,'1'),(77,'!=','!=','gen_query_type','查询方式','20',0,1,NULL,1,NULL,NULL,'1'),(78,'&gt;','&gt;','gen_query_type','查询方式','30',0,1,NULL,1,NULL,NULL,'1'),(79,'&lt;','&lt;','gen_query_type','查询方式','40',0,1,NULL,1,NULL,NULL,'1'),(80,'Between','between','gen_query_type','查询方式','50',0,1,NULL,1,NULL,NULL,'1'),(81,'Like','like','gen_query_type','查询方式','60',0,1,NULL,1,NULL,NULL,'1'),(82,'Left Like','left_like','gen_query_type','查询方式','70',0,1,NULL,1,NULL,NULL,'1'),(83,'Right Like','right_like','gen_query_type','查询方式','80',0,1,NULL,1,NULL,NULL,'1'),(84,'文本框','input','gen_show_type','字段生成方案','10',0,1,NULL,1,NULL,NULL,'1'),(85,'文本域','textarea','gen_show_type','字段生成方案','20',0,1,NULL,1,NULL,NULL,'1'),(86,'下拉框','select','gen_show_type','字段生成方案','30',0,1,NULL,1,NULL,NULL,'1'),(87,'复选框','checkbox','gen_show_type','字段生成方案','40',0,1,NULL,1,NULL,NULL,'1'),(88,'单选框','radiobox','gen_show_type','字段生成方案','50',0,1,NULL,1,NULL,NULL,'1'),(89,'日期选择','dateselect','gen_show_type','字段生成方案','60',0,1,NULL,1,NULL,NULL,'1'),(90,'人员选择','userselect','gen_show_type','字段生成方案','70',0,1,NULL,1,NULL,NULL,'1'),(91,'部门选择','officeselect','gen_show_type','字段生成方案','80',0,1,NULL,1,NULL,NULL,'1'),(92,'区域选择','areaselect','gen_show_type','字段生成方案','90',0,1,NULL,1,NULL,NULL,'1'),(93,'String','String','gen_java_type','Java类型','10',0,1,NULL,1,NULL,NULL,'1'),(94,'Long','Long','gen_java_type','Java类型','20',0,1,NULL,1,NULL,NULL,'1'),(95,'仅持久层','dao','gen_category','代码生成分类','40',0,1,NULL,1,NULL,NULL,'1'),(96,'男','1','sex','性别','10',0,1,NULL,1,NULL,NULL,'0'),(97,'女','2','sex','性别','20',0,1,NULL,1,NULL,NULL,'0'),(98,'Integer','Integer','gen_java_type','Java类型','30',0,1,NULL,1,NULL,NULL,'1'),(99,'Double','Double','gen_java_type','Java类型','40',0,1,NULL,1,NULL,NULL,'1'),(100,'Date','java.util.Date','gen_java_type','Java类型','50',0,1,NULL,1,NULL,NULL,'1'),(104,'Custom','Custom','gen_java_type','Java类型','90',0,1,NULL,1,NULL,NULL,'1'),(105,'会议通告','1','oa_notify_type','通知通告类型','10',0,1,NULL,1,NULL,NULL,'0'),(106,'奖惩通告','2','oa_notify_type','通知通告类型','20',0,1,NULL,1,NULL,NULL,'0'),(107,'活动通告','3','oa_notify_type','通知通告类型','30',0,1,NULL,1,NULL,NULL,'0'),(108,'草稿','0','oa_notify_status','通知通告状态','10',0,1,NULL,1,NULL,NULL,'0'),(109,'发布','1','oa_notify_status','通知通告状态','20',0,1,NULL,1,NULL,NULL,'0'),(110,'未读','0','oa_notify_read','通知通告状态','10',0,1,NULL,1,NULL,NULL,'0'),(111,'已读','1','oa_notify_read','通知通告状态','20',0,1,NULL,1,NULL,NULL,'0'),(112,'草稿','0','oa_notify_status','通知通告状态','10',0,1,NULL,1,NULL,'','0'),(113,'删除','0','del_flag','删除标记',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(118,'关于','about','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'全url是:/blog/open/page/about',''),(119,'交流','communication','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(120,'文章','article','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(121,'编码','code','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(122,'绘画','painting','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'','');

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `sys_file` */

insert  into `sys_file`(`id`,`type`,`url`,`create_date`) values (110,0,'/files/d64a62e3-6821-48f1-bac6-a1b9945f4afb.jpg','2017-10-14 16:20:17'),(111,0,'/files/aa2c3dc6-495f-48cc-8e12-446eceb2535e.jpg','2017-10-14 16:20:21'),(118,0,'/files/a973499e-3ec7-4d43-8a52-b6f6517c77e3.jpg','2017-10-20 11:53:52'),(132,0,'/files/e6f13526-e31c-4ebe-a3cf-5fd88dd10be6.jpg','2017-12-18 20:19:51'),(134,0,'/files/cd016e72-77f7-4425-afe2-b79dfbdc3ae9.jpeg','2017-12-18 22:44:07'),(138,0,'/files/9ec12ee7-65b5-4cc5-9900-d2ec6185b336.jpg','2017-12-19 19:55:27'),(139,0,'/files/f6aab9d4-00a1-4bc8-a695-40fc472d4ea9.jpg','2018-01-02 19:53:24'),(141,0,'/files/445c5d98-b3b6-4226-a5af-249d1b2a6a34.jpg','2018-01-09 19:28:53');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

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
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL),(2,3,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL),(3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43'),(6,3,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL),(7,3,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL),(12,6,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL),(13,6,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:52:06',NULL),(14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL),(15,7,'新增','','sys:role:add',2,'',0,'2017-08-14 10:56:37',NULL),(20,2,'新增','','sys:menu:add',2,'',0,'2017-08-14 10:59:32',NULL),(21,2,'编辑','','sys:menu:edit',2,'',0,'2017-08-14 10:59:56',NULL),(22,2,'删除','','sys:menu:remove',2,'',0,'2017-08-14 11:00:26',NULL),(24,6,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 17:27:18',NULL),(25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL),(26,6,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 17:28:34',NULL),(27,91,'系统日志','common/log','common:log',1,'fa fa-warning',0,'2017-08-14 22:11:53',NULL),(28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL),(29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL),(30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL),(48,77,'代码生成','common/generator','common:generator',1,'fa fa-code',3,NULL,NULL),(49,0,'博客管理','','',0,'fa fa-rss',6,NULL,NULL),(50,49,'文章列表','blog/bContent','blog:bContent:bContent',1,'fa fa-file-image-o',1,NULL,NULL),(51,50,'新增','','blog:bContent:add',2,'',NULL,NULL,NULL),(55,7,'编辑','','sys:role:edit',2,'',NULL,NULL,NULL),(56,7,'删除','','sys:role:remove',2,NULL,NULL,NULL,NULL),(57,91,'运行监控','/druid/index.html','',1,'fa fa-caret-square-o-right',1,NULL,NULL),(58,50,'编辑','','blog:bContent:edit',2,NULL,NULL,NULL,NULL),(59,50,'删除','','blog:bContent:remove',2,NULL,NULL,NULL,NULL),(60,50,'批量删除','','blog:bContent:batchRemove',2,NULL,NULL,NULL,NULL),(61,2,'批量删除','','sys:menu:batchRemove',2,NULL,NULL,NULL,NULL),(62,7,'批量删除','','sys:role:batchRemove',2,NULL,NULL,NULL,NULL),(68,49,'发布文章','/blog/bContent/add','blog:bContent:add',1,'fa fa-edit',0,NULL,NULL),(71,1,'文件管理','/common/sysFile','common:sysFile:sysFile',1,'fa fa-folder-open',2,NULL,NULL),(72,77,'计划任务','common/job','common:taskScheduleJob',1,'fa fa-hourglass-1',4,NULL,NULL),(73,3,'部门管理','/system/sysDept','system:sysDept:sysDept',1,'fa fa-users',3,NULL,NULL),(74,73,'增加','/system/sysDept/add','system:sysDept:add',2,NULL,1,NULL,NULL),(75,73,'刪除','system/sysDept/remove','system:sysDept:remove',2,NULL,2,NULL,NULL),(76,73,'编辑','/system/sysDept/edit','system:sysDept:edit',2,NULL,3,NULL,NULL),(77,0,'系统工具','','',0,'fa fa-gear',4,NULL,NULL),(78,1,'数据字典','/common/dict','common:dict:dict',1,'fa fa-book',1,NULL,NULL),(79,78,'增加','/common/dict/add','common:dict:add',2,NULL,2,NULL,NULL),(80,78,'编辑','/common/dict/edit','common:dict:edit',2,NULL,2,NULL,NULL),(81,78,'删除','/common/dict/remove','common:dict:remove',2,'',3,NULL,NULL),(83,78,'批量删除','/common/dict/batchRemove','common:dict:batchRemove',2,'',4,NULL,NULL),(84,0,'办公管理','','',0,'fa fa-laptop',5,NULL,NULL),(85,84,'通知公告','oa/notify','oa:notify:notify',1,'fa fa-pencil-square',NULL,NULL,NULL),(86,85,'新增','oa/notify/add','oa:notify:add',2,'fa fa-plus',1,NULL,NULL),(87,85,'编辑','oa/notify/edit','oa:notify:edit',2,'fa fa-pencil-square-o',2,NULL,NULL),(88,85,'删除','oa/notify/remove','oa:notify:remove',2,'fa fa-minus',NULL,NULL,NULL),(89,85,'批量删除','oa/notify/batchRemove','oa:notify:batchRemove',2,'',NULL,NULL,NULL),(90,84,'我的通知','oa/notify/selfNotify','',1,'fa fa-envelope-square',NULL,NULL,NULL),(91,0,'系统监控','','',0,'fa fa-video-camera',5,NULL,NULL),(92,91,'在线用户','sys/online','',1,'fa fa-user',NULL,NULL,NULL),(93,0,'工作流程','','',0,'fa fa-print',6,NULL,NULL),(94,93,'模型管理','activiti/model','',1,'fa fa-sort-amount-asc',NULL,NULL,NULL),(95,94,'全部权限','','activiti:model',2,'',NULL,NULL,NULL),(96,93,'流程管理','activiti/process','',1,'fa fa-flag',NULL,NULL,NULL),(97,0,'图表管理','','',0,'fa fa-bar-chart',7,NULL,NULL),(98,97,'百度chart','/chart/graph_echarts.html','',1,'fa fa-area-chart',NULL,NULL,NULL),(99,96,'所有权限','','act:process',2,'',NULL,NULL,NULL),(101,93,'待办任务','activiti/task/todo','',1,'',NULL,NULL,NULL),(104,77,'swagger','/swagger-ui.html','',1,'',NULL,NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_sign`,`remark`,`user_id_create`,`gmt_create`,`gmt_modified`) values (1,'超级用户角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59'),(59,'普通用户',NULL,'基本用户权限',NULL,NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3284 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (367,44,1),(368,44,32),(369,44,33),(370,44,34),(371,44,35),(372,44,28),(373,44,29),(374,44,30),(375,44,38),(376,44,4),(377,44,27),(378,45,38),(379,46,3),(380,46,20),(381,46,21),(382,46,22),(383,46,23),(384,46,11),(385,46,12),(386,46,13),(387,46,14),(388,46,24),(389,46,25),(390,46,26),(391,46,15),(392,46,2),(393,46,6),(394,46,7),(598,50,38),(632,38,42),(737,51,38),(738,51,39),(739,51,40),(740,51,41),(741,51,4),(742,51,32),(743,51,33),(744,51,34),(745,51,35),(746,51,27),(747,51,28),(748,51,29),(749,51,30),(750,51,1),(1064,54,53),(1095,55,2),(1096,55,6),(1097,55,7),(1098,55,3),(1099,55,50),(1100,55,49),(1101,55,1),(1856,53,28),(1857,53,29),(1858,53,30),(1859,53,27),(1860,53,57),(1861,53,71),(1862,53,48),(1863,53,72),(1864,53,1),(1865,53,7),(1866,53,55),(1867,53,56),(1868,53,62),(1869,53,15),(1870,53,2),(1871,53,61),(1872,53,20),(1873,53,21),(1874,53,22),(2084,56,68),(2085,56,60),(2086,56,59),(2087,56,58),(2088,56,51),(2089,56,50),(2090,56,49),(2243,48,72),(2247,63,-1),(2248,63,84),(2249,63,85),(2250,63,88),(2251,63,87),(2252,64,84),(2253,64,89),(2254,64,88),(2255,64,87),(2256,64,86),(2257,64,85),(2258,65,89),(2259,65,88),(2260,65,86),(2262,67,48),(2263,68,88),(2264,68,87),(2265,69,89),(2266,69,88),(2267,69,86),(2268,69,87),(2269,69,85),(2270,69,84),(2271,70,85),(2272,70,89),(2273,70,88),(2274,70,87),(2275,70,86),(2276,70,84),(2277,71,87),(2278,72,59),(2279,73,48),(2280,74,88),(2281,74,87),(2282,75,88),(2283,75,87),(2284,76,85),(2285,76,89),(2286,76,88),(2287,76,87),(2288,76,86),(2289,76,84),(2292,78,88),(2293,78,87),(2294,78,NULL),(2295,78,NULL),(2296,78,NULL),(2308,80,87),(2309,80,86),(2310,80,-1),(2311,80,84),(2312,80,85),(2328,79,72),(2329,79,48),(2330,79,77),(2331,79,84),(2332,79,89),(2333,79,88),(2334,79,87),(2335,79,86),(2336,79,85),(2337,79,-1),(2338,77,89),(2339,77,88),(2340,77,87),(2341,77,86),(2342,77,85),(2343,77,84),(2344,77,72),(2345,77,-1),(2346,77,77),(2974,57,93),(2975,57,99),(2976,57,95),(2977,57,101),(2978,57,96),(2979,57,94),(2980,57,-1),(2981,58,93),(2982,58,99),(2983,58,95),(2984,58,101),(2985,58,96),(2986,58,94),(2987,58,-1),(3115,1,103),(3116,1,98),(3117,1,101),(3118,1,99),(3119,1,95),(3120,1,92),(3121,1,57),(3122,1,30),(3123,1,29),(3124,1,28),(3125,1,90),(3126,1,89),(3127,1,88),(3128,1,87),(3129,1,86),(3130,1,72),(3131,1,48),(3132,1,68),(3133,1,60),(3134,1,59),(3135,1,58),(3136,1,51),(3137,1,76),(3138,1,75),(3139,1,74),(3140,1,62),(3141,1,56),(3142,1,55),(3143,1,15),(3144,1,26),(3145,1,25),(3146,1,24),(3147,1,14),(3148,1,13),(3149,1,12),(3150,1,61),(3151,1,22),(3152,1,21),(3153,1,20),(3154,1,83),(3155,1,81),(3156,1,80),(3157,1,79),(3158,1,71),(3159,1,102),(3160,1,97),(3161,1,96),(3162,1,94),(3163,1,93),(3164,1,27),(3165,1,91),(3166,1,85),(3167,1,84),(3168,1,50),(3169,1,49),(3170,1,73),(3171,1,7),(3172,1,6),(3173,1,2),(3174,1,3),(3175,1,78),(3176,1,1),(3177,1,104),(3178,1,77),(3179,1,-1),(3232,59,98),(3233,59,101),(3234,59,99),(3235,59,95),(3236,59,90),(3237,59,89),(3238,59,88),(3239,59,87),(3240,59,86),(3241,59,68),(3242,59,60),(3243,59,59),(3244,59,58),(3245,59,51),(3246,59,76),(3247,59,75),(3248,59,74),(3249,59,62),(3250,59,56),(3251,59,55),(3252,59,15),(3253,59,26),(3254,59,25),(3255,59,24),(3256,59,14),(3257,59,13),(3258,59,12),(3259,59,61),(3260,59,22),(3261,59,21),(3262,59,20),(3263,59,83),(3264,59,81),(3265,59,80),(3266,59,79),(3267,59,71),(3268,59,97),(3269,59,96),(3270,59,94),(3271,59,93),(3272,59,85),(3273,59,84),(3274,59,50),(3275,59,49),(3276,59,73),(3277,59,7),(3278,59,6),(3279,59,2),(3280,59,3),(3281,59,78),(3282,59,1),(3283,59,-1);

/*Table structure for table `sys_task` */

DROP TABLE IF EXISTS `sys_task`;

CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_task` */

insert  into `sys_task`(`id`,`cron_expression`,`method_name`,`is_concurrent`,`description`,`update_by`,`bean_class`,`create_date`,`job_status`,`job_group`,`update_date`,`create_by`,`spring_bean`,`job_name`) values (2,'0/10 * * * * ?','run1','1','','4028ea815a3d2a8c015a3d2f8d2a0002','com.xzbdommon.task.WelcomeJob','2017-05-19 18:30:56','0','group1','2017-05-19 18:31:07',NULL,'','welcomJob');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`name`,`password`,`dept_id`,`email`,`mobile`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`sex`,`birth`,`pic_id`,`live_address`,`hobby`,`province`,`city`,`district`) values (1,'admin','超级管理员','27bd386e70f280e24c2f4f2a549b82cf',6,'admin@example.com','17699999999',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00',96,'2017-12-14 00:00:00',138,'ccc','122;121;','北京市','北京市市辖区','东城区'),(2,'test','临时用户','6cf3bb3deba2aadbd41ec9a22511084e',6,'test@xzbd.com',NULL,1,1,'2017-08-14 13:43:05','2017-08-14 21:15:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'ldh','刘德华','bfd9394475754fbe45866eba97738c36',7,'ldh@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'zxy','张学友','35174ba93f5fe7267f1fb3c1bf903781',6,'zxy@xzbd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'wyf','吴亦凡','e179e6f687bbd57b9d7efc4746c8090a',6,'wyf@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'lh','鹿晗','7924710cd673f68967cde70e188bb097',9,'lh@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,'lhc','令狐冲','d515538e17ecb570ba40344b5618f5d4',6,'lhc@xzbd.com',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,'lyf','刘亦菲','7fdb1d9008f45950c1620ba0864e5fbd',13,'lyf@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'lyh','李彦宏','dc26092b3244d9d432863f2738180e19',8,'lyh@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'wjl','王健林','3967697dfced162cf6a34080259b83aa',6,'wjl@bootod.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'gdg','郭德纲','3bb1bda86bc02bf6478cd91e42135d2f',9,'gdg@xzbd.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user_plus` */

DROP TABLE IF EXISTS `sys_user_plus`;

CREATE TABLE `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_plus` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (73,30,48),(74,30,49),(75,30,50),(76,31,48),(77,31,49),(78,31,52),(79,32,48),(80,32,49),(81,32,50),(82,32,51),(83,32,52),(84,33,38),(85,33,49),(86,33,52),(87,34,50),(88,34,51),(89,34,52),(106,124,1),(110,1,1),(111,2,1),(113,131,48),(117,135,1),(120,134,1),(121,134,48),(123,130,1),(124,NULL,48),(125,132,52),(126,132,49),(127,123,48),(132,36,48);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
