/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-08 01:20:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `manageer_id` bigint(20) DEFAULT NULL COMMENT '部门经理ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0：正常；-1：停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '1', '研发部', null, null, null);
INSERT INTO `department` VALUES ('2', '2', '运营部', null, null, null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `phone_number` varchar(13) NOT NULL COMMENT '电话号码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `input_time` date DEFAULT NULL COMMENT '录入时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '0：正常；-1：离职',
  `admin` tinyint(1) DEFAULT NULL COMMENT '0：普通；1：超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', '丢失的橘子', '1', '10086', '10086@qq.com', '1', '2018-04-23', '1', '1');
INSERT INTO `employee` VALUES ('2', 'zhou', '橘子喵', '123456', '10010', '10010@163.com', '2', '2018-04-05', '0', '0');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opUser_id` bigint(20) DEFAULT NULL,
  `opTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `opId` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `params` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp` (`opUser_id`),
  CONSTRAINT `FK_emp` FOREIGN KEY (`opUser_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', null, '2018-05-09 23:28:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('2', '1', '2018-05-09 23:28:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('3', '1', '2018-05-09 23:28:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('4', '1', '2018-05-09 23:28:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('5', '1', '2018-05-09 23:28:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":\"的橘子\",\"start\":0}]');
INSERT INTO `log` VALUES ('6', null, '2018-05-13 22:34:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('7', '1', '2018-05-13 22:34:48', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('8', '1', '2018-05-13 22:34:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('9', '1', '2018-05-13 22:34:50', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('10', '1', '2018-05-13 22:34:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('11', '1', '2018-05-13 22:34:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('12', '1', '2018-05-13 22:34:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('13', '1', '2018-05-13 22:34:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('14', '1', '2018-05-13 22:34:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('15', '1', '2018-05-13 22:34:57', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('16', '1', '2018-05-13 22:35:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('17', '1', '2018-05-13 22:35:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('18', null, '2018-05-18 00:04:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('19', null, '2018-05-18 00:04:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('20', '1', '2018-05-18 00:04:06', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('21', '1', '2018-05-18 00:04:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('22', '1', '2018-05-18 00:04:13', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('23', null, '2018-05-19 22:15:11', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('24', '1', '2018-05-19 22:15:12', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('25', '1', '2018-05-19 22:15:13', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('26', '1', '2018-05-19 22:15:14', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('27', '1', '2018-05-19 22:15:21', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('28', '1', '2018-05-19 22:15:22', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('29', '1', '2018-05-19 22:15:43', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('30', '1', '2018-05-19 22:15:43', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('31', '1', '2018-05-19 22:15:45', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('32', '1', '2018-05-19 22:15:46', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('33', '1', '2018-05-19 22:15:57', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('34', '1', '2018-05-19 22:15:57', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('35', '1', '2018-05-19 22:16:00', '127.0.0.1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('36', '1', '2018-05-19 22:18:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('37', '1', '2018-05-19 22:19:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('38', '1', '2018-05-19 22:19:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('39', '1', '2018-05-19 22:26:01', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('40', '1', '2018-05-19 22:26:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('41', '1', '2018-05-19 22:27:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('42', '1', '2018-05-19 22:27:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('43', '1', '2018-05-19 22:28:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('44', '1', '2018-05-19 22:28:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('45', null, '2018-05-20 23:13:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('46', '1', '2018-05-20 23:13:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('47', '1', '2018-05-20 23:13:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('48', '1', '2018-05-20 23:13:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('49', '1', '2018-05-20 23:13:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('50', null, '2018-05-22 22:50:22', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('51', '1', '2018-05-22 22:50:22', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('52', '1', '2018-05-22 22:50:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('53', '1', '2018-05-22 22:51:26', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('54', '1', '2018-05-22 23:23:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('55', null, '2018-05-22 23:27:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('56', '1', '2018-05-22 23:27:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('57', '1', '2018-05-22 23:27:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('58', '1', '2018-05-22 23:27:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":1,\"name\":\"\",\"sn\":\"\",\"permission\":[]}]');
INSERT INTO `log` VALUES ('59', '1', '2018-05-22 23:27:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":2,\"name\":\"\",\"sn\":\"\",\"permission\":[]}]');
INSERT INTO `log` VALUES ('60', null, '2018-05-22 23:28:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('61', '1', '2018-05-22 23:28:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('62', '1', '2018-05-22 23:28:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('63', '1', '2018-05-22 23:29:06', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":3,\"name\":\"\",\"sn\":\"\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":2,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('64', null, '2018-05-24 23:47:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('65', '1', '2018-05-24 23:47:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('66', '1', '2018-05-24 23:47:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('67', '1', '2018-05-24 23:47:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('68', '1', '2018-05-24 23:47:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":4,\"name\":\"HR\",\"sn\":\"人事专员\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":2,\"name\":null,\"resource\":null},{\"id\":3,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('69', '1', '2018-05-24 23:47:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('70', '1', '2018-05-24 23:49:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('71', '1', '2018-05-24 23:49:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('72', '1', '2018-05-24 23:49:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('73', '1', '2018-05-24 23:49:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('74', '1', '2018-05-24 23:50:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('75', '1', '2018-05-24 23:50:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('76', '1', '2018-05-24 23:50:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('77', '1', '2018-05-24 23:50:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('78', '1', '2018-05-24 23:52:50', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('79', '1', '2018-05-24 23:52:50', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('80', '1', '2018-05-24 23:53:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('81', '1', '2018-05-24 23:53:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('82', '1', '2018-05-24 23:53:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('83', '1', '2018-05-24 23:53:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('84', '1', '2018-05-24 23:54:34', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('85', '1', '2018-05-24 23:54:34', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('86', '1', '2018-05-24 23:54:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('87', '1', '2018-05-24 23:54:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('88', '1', '2018-05-24 23:54:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('89', '1', '2018-05-24 23:54:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('90', '1', '2018-05-24 23:54:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('91', '1', '2018-05-24 23:54:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('92', '1', '2018-05-24 23:54:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('93', '1', '2018-05-24 23:54:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('94', '1', '2018-05-24 23:54:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('95', '1', '2018-05-24 23:54:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('96', '1', '2018-05-24 23:54:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('97', '1', '2018-05-24 23:54:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('98', '1', '2018-05-24 23:54:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('99', '1', '2018-05-24 23:54:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('100', '1', '2018-05-24 23:55:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('101', '1', '2018-05-24 23:55:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('102', null, '2018-05-27 23:03:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('103', null, '2018-05-27 23:03:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('104', '1', '2018-05-27 23:03:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('105', '1', '2018-05-27 23:03:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('106', '1', '2018-05-27 23:03:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', null);
INSERT INTO `log` VALUES ('107', '1', '2018-05-27 23:03:25', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', null);
INSERT INTO `log` VALUES ('108', '1', '2018-05-27 23:03:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', null);
INSERT INTO `log` VALUES ('109', null, '2018-05-27 23:05:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('110', '1', '2018-05-27 23:05:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('111', '1', '2018-05-27 23:05:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('112', '1', '2018-05-27 23:05:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('113', '1', '2018-05-27 23:05:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', null);
INSERT INTO `log` VALUES ('114', '1', '2018-05-27 23:07:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('115', '1', '2018-05-27 23:07:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('116', '1', '2018-05-27 23:07:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('117', '1', '2018-05-27 23:07:22', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('118', '1', '2018-05-27 23:07:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('119', '1', '2018-05-27 23:07:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('120', '1', '2018-05-27 23:07:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('121', '1', '2018-05-27 23:08:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('122', '1', '2018-05-27 23:08:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('123', '1', '2018-05-27 23:08:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('124', '1', '2018-05-27 23:08:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('125', '1', '2018-05-27 23:08:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('126', '1', '2018-05-27 23:08:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('127', '1', '2018-05-27 23:08:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('128', '1', '2018-05-27 23:08:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('129', '1', '2018-05-27 23:09:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('130', '1', '2018-05-27 23:09:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('131', '1', '2018-05-27 23:09:20', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('132', '1', '2018-05-27 23:09:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('133', '1', '2018-05-27 23:10:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":5,\"name\":\"dept\",\"sn\":\"部门经理\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('134', '1', '2018-05-27 23:10:13', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('135', '1', '2018-05-27 23:10:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":5,\"start\":0}]');
INSERT INTO `log` VALUES ('136', '1', '2018-05-27 23:10:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('137', '1', '2018-05-27 23:10:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":5,\"start\":0}]');
INSERT INTO `log` VALUES ('138', null, '2018-06-05 21:32:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[null,null]');
INSERT INTO `log` VALUES ('139', null, '2018-06-05 21:32:50', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('140', '1', '2018-06-05 21:32:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('141', '1', '2018-06-05 21:32:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('142', null, '2018-06-05 21:33:26', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('143', '1', '2018-06-05 21:33:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('144', '1', '2018-06-05 21:33:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('145', '1', '2018-06-05 21:33:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('146', '1', '2018-06-05 21:34:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('147', '1', '2018-06-05 21:34:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('148', '1', '2018-06-05 21:34:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('149', '1', '2018-06-05 21:34:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('150', '1', '2018-06-05 21:34:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('151', '1', '2018-06-05 21:34:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('152', '1', '2018-06-05 21:34:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('153', '1', '2018-06-05 21:34:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('154', '1', '2018-06-05 21:34:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('155', '1', '2018-06-05 21:34:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('156', null, '2018-06-05 21:44:25', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('157', '1', '2018-06-05 21:44:26', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('158', '1', '2018-06-05 21:44:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('159', '1', '2018-06-05 21:44:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('160', '1', '2018-06-05 21:44:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('161', '1', '2018-06-05 21:44:37', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":5,\"start\":0}]');
INSERT INTO `log` VALUES ('162', '1', '2018-06-05 21:44:39', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:updateByPrimaryKey', '[{\"id\":5,\"name\":\"dept\",\"sn\":\"部门经理\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":2,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('163', '1', '2018-06-05 21:44:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('164', '1', '2018-06-05 21:44:41', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":5,\"start\":0}]');
INSERT INTO `log` VALUES ('165', '1', '2018-06-05 21:44:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('166', '1', '2018-06-05 21:44:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:updateByPrimaryKey', '[{\"id\":4,\"name\":\"HR\",\"sn\":\"人事专员\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":3,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('167', '1', '2018-06-05 21:44:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('168', '1', '2018-06-05 21:44:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":4,\"start\":0}]');
INSERT INTO `log` VALUES ('169', null, '2018-06-05 22:33:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('170', '1', '2018-06-05 22:33:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('171', '1', '2018-06-05 22:33:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('172', '1', '2018-06-05 22:33:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('173', '1', '2018-06-05 22:33:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:deleteByPrimaryKey', '[null]');
INSERT INTO `log` VALUES ('174', '1', '2018-06-05 22:33:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('175', '1', '2018-06-05 22:33:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:deleteByPrimaryKey', '[null]');
INSERT INTO `log` VALUES ('176', '1', '2018-06-05 22:33:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('177', '1', '2018-06-05 22:33:26', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('178', '1', '2018-06-05 22:33:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('179', '1', '2018-06-05 22:33:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('180', '1', '2018-06-05 22:33:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('181', '1', '2018-06-05 22:34:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:deleteByPrimaryKey', '[null]');
INSERT INTO `log` VALUES ('182', '1', '2018-06-05 22:34:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('183', null, '2018-06-05 22:35:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('184', '1', '2018-06-05 22:35:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('185', '1', '2018-06-05 22:35:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('186', '1', '2018-06-05 22:35:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:deleteByPrimaryKey', '[5]');
INSERT INTO `log` VALUES ('187', '1', '2018-06-05 22:35:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('188', '1', '2018-06-05 22:35:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":6,\"name\":\"部门经理\",\"sn\":\"dept\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('189', '1', '2018-06-05 22:35:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('190', '1', '2018-06-05 22:35:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:deleteByPrimaryKey', '[6]');
INSERT INTO `log` VALUES ('191', '1', '2018-06-05 22:35:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('192', '1', '2018-06-05 22:36:06', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:insert', '[{\"id\":7,\"name\":\"dept\",\"sn\":\"部门经理\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES ('193', '1', '2018-06-05 22:36:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('194', null, '2018-06-07 00:45:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('195', null, '2018-06-07 00:45:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('196', '1', '2018-06-07 00:45:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('197', '1', '2018-06-07 00:45:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('198', '1', '2018-06-07 00:45:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('199', '1', '2018-06-07 00:45:57', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('200', '1', '2018-06-07 00:46:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('201', '1', '2018-06-07 00:46:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('202', '1', '2018-06-07 00:46:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('203', '1', '2018-06-07 00:46:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('204', '1', '2018-06-07 00:46:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('205', '1', '2018-06-07 00:46:10', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('206', '1', '2018-06-07 00:46:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('207', '1', '2018-06-07 00:46:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('208', '1', '2018-06-07 00:46:13', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('209', '1', '2018-06-07 00:46:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('210', '1', '2018-06-07 00:46:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('211', '1', '2018-06-07 00:46:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('212', '1', '2018-06-07 00:46:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('213', '1', '2018-06-07 00:47:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('214', '1', '2018-06-07 00:47:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('215', '1', '2018-06-07 00:47:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('216', '1', '2018-06-07 00:47:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('217', '1', '2018-06-07 00:47:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('218', '1', '2018-06-07 00:47:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('219', '1', '2018-06-07 00:48:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('220', '1', '2018-06-07 00:48:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('221', '1', '2018-06-07 00:49:34', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('222', '1', '2018-06-07 00:49:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('223', '1', '2018-06-07 00:49:39', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('224', '1', '2018-06-07 00:50:01', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('225', '1', '2018-06-07 00:50:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('226', '1', '2018-06-07 00:50:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('227', '1', '2018-06-07 00:50:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('228', '1', '2018-06-07 00:50:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('229', '1', '2018-06-07 00:50:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('230', '1', '2018-06-07 00:50:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('231', '1', '2018-06-07 00:50:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('232', '1', '2018-06-07 00:50:13', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('233', '1', '2018-06-07 00:50:14', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('234', '1', '2018-06-07 00:50:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('235', '1', '2018-06-07 00:50:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('236', '1', '2018-06-07 00:50:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('237', '1', '2018-06-07 00:50:19', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('238', '1', '2018-06-07 00:51:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('239', '1', '2018-06-07 00:51:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('240', '1', '2018-06-07 00:51:39', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('241', '1', '2018-06-07 00:51:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('242', '1', '2018-06-07 00:52:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('243', '1', '2018-06-07 00:52:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('244', '1', '2018-06-07 00:52:10', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('245', '1', '2018-06-07 00:52:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('246', '1', '2018-06-07 00:52:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('247', '1', '2018-06-07 00:52:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('248', '1', '2018-06-07 00:52:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('249', '1', '2018-06-07 00:52:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('250', '1', '2018-06-07 00:52:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('251', '1', '2018-06-07 00:52:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('252', '1', '2018-06-07 00:52:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('253', '1', '2018-06-07 00:52:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('254', '1', '2018-06-07 00:52:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('255', '1', '2018-06-07 00:54:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('256', '1', '2018-06-07 00:54:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('257', '1', '2018-06-07 00:54:17', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('258', '1', '2018-06-07 00:54:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('259', '1', '2018-06-07 00:54:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('260', '1', '2018-06-07 00:54:21', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('261', '1', '2018-06-07 00:54:22', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('262', '1', '2018-06-07 00:54:26', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('263', '1', '2018-06-07 00:54:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('264', '1', '2018-06-07 00:54:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('265', '1', '2018-06-07 00:54:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('266', '1', '2018-06-07 00:54:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('267', '1', '2018-06-07 00:54:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('268', '1', '2018-06-07 00:54:39', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('269', '1', '2018-06-07 00:54:39', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('270', '1', '2018-06-07 00:54:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('271', '1', '2018-06-07 00:54:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('272', '1', '2018-06-07 00:54:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('273', '1', '2018-06-07 00:54:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('274', '1', '2018-06-07 00:54:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('275', '1', '2018-06-07 00:54:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('276', '1', '2018-06-07 00:55:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('277', '1', '2018-06-07 00:55:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('278', '1', '2018-06-07 00:55:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('279', '1', '2018-06-07 00:55:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('280', '1', '2018-06-07 00:55:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('281', '1', '2018-06-07 00:55:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('282', '1', '2018-06-07 00:57:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('283', '1', '2018-06-07 00:57:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('284', '1', '2018-06-07 00:57:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('285', '1', '2018-06-07 00:57:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('286', null, '2018-06-07 00:58:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('287', '1', '2018-06-07 00:58:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('288', '1', '2018-06-07 00:58:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('289', '1', '2018-06-07 00:58:03', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('290', '1', '2018-06-07 00:58:04', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('291', '1', '2018-06-07 00:58:48', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('292', '1', '2018-06-07 00:58:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('293', '1', '2018-06-07 00:58:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('294', '1', '2018-06-07 00:58:51', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('295', '1', '2018-06-07 00:59:57', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('296', '1', '2018-06-07 00:59:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('297', '1', '2018-06-07 00:59:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('298', null, '2018-06-07 01:00:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('299', '1', '2018-06-07 01:00:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('300', '1', '2018-06-07 01:00:23', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('301', '1', '2018-06-07 01:00:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('302', '1', '2018-06-07 01:00:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('303', '1', '2018-06-07 01:00:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('304', '1', '2018-06-07 01:00:57', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('305', '1', '2018-06-07 01:00:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('306', '1', '2018-06-07 01:00:58', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('307', '1', '2018-06-07 01:01:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('308', '1', '2018-06-07 01:01:09', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('309', null, '2018-06-07 01:01:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('310', '1', '2018-06-07 01:01:18', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('311', null, '2018-06-07 01:01:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('312', '1', '2018-06-07 01:01:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('313', '1', '2018-06-07 01:01:46', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('314', '1', '2018-06-07 01:01:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('315', '1', '2018-06-07 01:01:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin9\",\"1\"]');
INSERT INTO `log` VALUES ('316', '1', '2018-06-07 01:01:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('317', '1', '2018-06-07 01:01:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin9\",\"1\"]');
INSERT INTO `log` VALUES ('318', '1', '2018-06-07 01:01:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('319', '1', '2018-06-07 01:01:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin9\",\"1\"]');
INSERT INTO `log` VALUES ('320', '1', '2018-06-07 01:01:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('321', '1', '2018-06-07 01:03:07', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('322', '1', '2018-06-07 01:03:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('323', '1', '2018-06-07 01:03:08', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('324', '1', '2018-06-07 01:03:32', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('325', '1', '2018-06-07 01:03:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('326', '1', '2018-06-07 01:03:33', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('327', '1', '2018-06-07 01:03:34', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('328', '1', '2018-06-07 01:03:37', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('329', '1', '2018-06-07 01:03:37', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('330', '1', '2018-06-07 01:03:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('331', '1', '2018-06-07 01:03:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('332', null, '2018-06-07 01:03:50', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('333', '1', '2018-06-07 01:03:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('334', '1', '2018-06-07 01:03:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin1\",\"1\"]');
INSERT INTO `log` VALUES ('335', '1', '2018-06-07 01:03:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"\",\"\"]');
INSERT INTO `log` VALUES ('336', null, '2018-06-07 01:25:24', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('337', '1', '2018-06-07 01:25:27', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('338', '1', '2018-06-07 01:25:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('339', '1', '2018-06-07 01:25:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('340', '1', '2018-06-07 01:25:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('341', '1', '2018-06-07 01:25:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('342', '1', '2018-06-07 01:25:52', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('343', '1', '2018-06-07 01:25:53', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('344', '1', '2018-06-07 01:25:54', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('345', '1', '2018-06-07 01:25:56', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('346', '1', '2018-06-07 01:25:57', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('347', '1', '2018-06-07 01:26:00', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('348', '1', '2018-06-07 01:26:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('349', '1', '2018-06-07 01:26:29', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('350', '1', '2018-06-07 01:26:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('351', '1', '2018-06-07 01:26:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('352', '1', '2018-06-07 01:26:37', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('353', '1', '2018-06-07 01:26:42', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('354', '1', '2018-06-07 01:26:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('355', '1', '2018-06-07 01:26:55', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('356', '1', '2018-06-07 01:28:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('357', '1', '2018-06-07 01:28:42', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('358', '1', '2018-06-07 01:28:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('359', '1', '2018-06-07 01:29:01', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('360', '1', '2018-06-07 01:29:05', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('361', '1', '2018-06-07 01:30:06', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('362', '1', '2018-06-07 01:30:10', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('363', '1', '2018-06-07 01:30:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('364', '1', '2018-06-07 01:30:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('365', '1', '2018-06-07 01:30:11', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('366', '1', '2018-06-07 01:30:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('367', '1', '2018-06-07 01:30:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('368', '1', '2018-06-07 01:30:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('369', '1', '2018-06-07 01:30:12', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('370', '1', '2018-06-07 01:30:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('371', '1', '2018-06-07 01:30:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('372', '1', '2018-06-07 01:30:40', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('373', '1', '2018-06-07 01:30:41', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('374', '1', '2018-06-07 01:30:42', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('375', '1', '2018-06-07 01:30:47', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('376', '1', '2018-06-07 01:32:13', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('377', '1', '2018-06-07 01:32:15', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"11\"]');
INSERT INTO `log` VALUES ('378', '1', '2018-06-07 01:32:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '[\"admin\",\"1\"]');
INSERT INTO `log` VALUES ('379', '1', '2018-06-07 01:32:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('380', '1', '2018-06-07 01:32:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('381', '1', '2018-06-07 01:32:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('382', '1', '2018-06-07 01:32:38', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('383', '1', '2018-06-07 01:32:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('384', '1', '2018-06-07 01:32:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('385', '1', '2018-06-07 01:32:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":\"\",\"start\":0}]');
INSERT INTO `log` VALUES ('386', '1', '2018-06-07 01:32:49', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":\"\",\"start\":0}]');
INSERT INTO `log` VALUES ('387', '1', '2018-06-07 01:33:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('388', '1', '2018-06-07 01:33:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('389', '1', '2018-06-07 01:33:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('390', '1', '2018-06-07 01:33:16', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('391', '1', '2018-06-07 01:33:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('392', '1', '2018-06-07 01:33:35', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('393', '1', '2018-06-07 01:33:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('394', '1', '2018-06-07 01:33:36', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('395', '1', '2018-06-07 01:33:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('396', '1', '2018-06-07 01:33:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('397', '1', '2018-06-07 01:33:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('398', '1', '2018-06-07 01:33:45', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('399', '1', '2018-06-07 01:33:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('400', '1', '2018-06-07 01:33:59', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('401', '1', '2018-06-07 01:34:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('402', '1', '2018-06-07 01:34:02', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('403', '1', '2018-06-07 01:34:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('404', '1', '2018-06-07 01:34:30', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('405', '1', '2018-06-07 01:34:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('406', '1', '2018-06-07 01:34:31', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('407', '1', '2018-06-07 01:34:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.DepartmentServiceImpl:queryForEmp', '[]');
INSERT INTO `log` VALUES ('408', '1', '2018-06-07 01:34:43', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.EmployeeServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"keyWord\":null,\"start\":0}]');
INSERT INTO `log` VALUES ('409', '1', '2018-06-07 01:34:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.RoleServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES ('410', '1', '2018-06-07 01:34:44', '0:0:0:0:0:0:0:1', 'com.tangerineSpecter.crm.service.impl.PermissionServiceImpl:queryForPage', '[{\"page\":1,\"rows\":10,\"rid\":null,\"start\":0}]');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `resource` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '员工新增', 'com.tangerineSpecter.crm.web.controller.EmployeeController:save');
INSERT INTO `permission` VALUES ('2', '员工更新', 'com.tangerineSpecter.crm.web.controller.EmployeeController:update');
INSERT INTO `permission` VALUES ('3', '员工离职', 'com.tangerineSpecter.crm.web.controller.EmployeeController:delete');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4', 'HR', '人事专员');
INSERT INTO `role` VALUES ('7', 'dept', '部门经理');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `r_id` bigint(20) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  KEY `FK_role` (`r_id`),
  KEY `FK_permission` (`p_id`),
  CONSTRAINT `FK_permission` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_role` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('7', '1');
