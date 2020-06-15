/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : 127.0.0.1:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-06-15 11:13:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  `book_describe` varchar(255) DEFAULT NULL,
  `book_numbers` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '数学复习全书', '李永乐', '考研复习不二之选', '233');
INSERT INTO `book` VALUES ('2', '数学复习全书', '李永乐', '考研复习不二之选', '432');
INSERT INTO `book` VALUES ('3', '接力题典1800', '汤家凤', '刷题必备', '996');
INSERT INTO `book` VALUES ('4', '含着泪写BUG:杨帅的自我修养', '杨帅', '从入门到放弃，从攻防到入狱', '9494');
INSERT INTO `book` VALUES ('5', 'TestBook2', 'TestBook', 'TestBook', '222');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('16', '帅哥', 'ssss');
INSERT INTO `user` VALUES ('19', 'shuai', '123');
INSERT INTO `user` VALUES ('20', 'shuai2', '123');
INSERT INTO `user` VALUES ('22', 'shuai3', '123');
INSERT INTO `user` VALUES ('23', 'shuaiaa', '123456');
INSERT INTO `user` VALUES ('24', 'asdasd', 'adadsas');
INSERT INTO `user` VALUES ('25', 'asdasd1', 'adadsas1');
INSERT INTO `user` VALUES ('26', 'asdadaa', '123123');
INSERT INTO `user` VALUES ('27', 'shuaige', '123456');
INSERT INTO `user` VALUES ('28', 'shuaishuai', '123456');
INSERT INTO `user` VALUES ('29', 'yangshuai', '123456');
INSERT INTO `user` VALUES ('30', 'yangshuai1', '123456');
INSERT INTO `user` VALUES ('31', 'shuaishuaia', '123456');
