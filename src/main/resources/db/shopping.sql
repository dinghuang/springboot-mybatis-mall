/*
Navicat MySQL Data Transfer

Source Server         : IDEA
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-07 11:57:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`,`time`,`product_id`),
  KEY `evaluation_ibfk_2` (`product_id`),
  CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `key_word` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_car
-- ----------------------------
DROP TABLE IF EXISTS `shopping_car`;
CREATE TABLE `shopping_car` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `shopping_car_ibfk_2` (`product_id`),
  CONSTRAINT `shopping_car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_car_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_car
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_record
-- ----------------------------
DROP TABLE IF EXISTS `shopping_record`;
CREATE TABLE `shopping_record` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`,`time`),
  KEY `shopping_record_ibfk_2` (`product_id`),
  CONSTRAINT `shopping_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_record
-- ----------------------------

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `post_number` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `register_time` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_detail
-- ----------------------------

-- ----------------------------
-- Table structure for user_main
-- ----------------------------
DROP TABLE IF EXISTS `user_main`;
CREATE TABLE `user_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nick_name` varchar(30) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_main
-- ----------------------------
