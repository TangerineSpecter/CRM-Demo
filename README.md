# CRM-Demo

## 简介

### 关系管理系统演示

客户服务是一个涉及多个部门，存在一定流程的工作。客户服务水平的高低决定着公司的核心竞争力。
该客户关系管理系统应提供一个客户服务在线平台，使客户服务处理过程中相关人员可以在线完成服务的处理和记录工作。

## 相关技术

**使用JDK版本：** 1.7

**搭建框架：** Spring+SpringMVC+MyBatis+Maven

**前端框架：** EasyUI

**插件集成：** mabatis代码生成器

基于AOP切面编程的日志记录

## 帮助

### 1.代码生成器的使用
```
1.配置generatorConfig.xml生成实体的表名
2.右键项目-->Maven build
3.配置指令：mybatis-generator:generate
4.Run运行
```

### 2.Maven运行项目
```
配置指令：tomcat7:run(根据tomcat版本而定)

### 3.集成lombok插件
执行resources/lib目录中的lombok-1.16.6.jar对IDE做集成
```
## 关于
```
本项目主要目的用于技术上的学习和交流。
```