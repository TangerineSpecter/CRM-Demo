/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-09 23:29:16
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
