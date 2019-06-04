/*
Navicat MySQL Data Transfer

Source Server         : hgz
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : diancan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-22 15:43:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_buyer_id` bigint(20) NOT NULL,
  `address_address` varchar(200) CHARACTER SET utf8 NOT NULL,
  `address_is_default` char(1) CHARACTER SET utf8 NOT NULL COMMENT '0否1是',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`address_buyer_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`address_buyer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '3', 'sadasdasdas', '0');
INSERT INTO `address` VALUES ('2', '3', '添加新地址', '1');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_buyer_id` bigint(20) NOT NULL,
  `car_product_id` bigint(20) NOT NULL,
  `car_product_num` int(11) NOT NULL,
  `car_product_price` double(10,2) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `car_buyer_id` (`car_buyer_id`),
  KEY `car_product_id` (`car_product_id`),
  CONSTRAINT `car_buyer_id` FOREIGN KEY (`car_buyer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `car_product_id` FOREIGN KEY (`car_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '3', '3', '1', '12.00');
INSERT INTO `car` VALUES ('2', '3', '2', '1', '120.00');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_order_id` bigint(20) NOT NULL,
  `item_product_id` bigint(20) NOT NULL,
  `item_product_num` int(11) NOT NULL,
  `item_product_price` double(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_order_id` (`item_order_id`),
  KEY `item_product_id` (`item_product_id`),
  CONSTRAINT `item_order_id` FOREIGN KEY (`item_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `item_product_id` FOREIGN KEY (`item_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单明细表';

-- ----------------------------
-- Records of item
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_seller_id` bigint(20) NOT NULL,
  `menu_product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `menu_seller_id` (`menu_seller_id`),
  KEY `menu_product_id` (`menu_product_id`),
  CONSTRAINT `menu_product_id` FOREIGN KEY (`menu_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `menu_seller_id` FOREIGN KEY (`menu_seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_buyer_id` bigint(20) NOT NULL,
  `order_seller_id` bigint(20) NOT NULL,
  `order_no` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `order_address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_delieve_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_finish_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_total_price` double(10,2) DEFAULT NULL,
  `order_payment` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `order_status` char(2) CHARACTER SET utf8 DEFAULT NULL,
  `order_comments` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_id` (`order_buyer_id`),
  KEY `order_sell_id` (`order_seller_id`),
  CONSTRAINT `order_sell_id` FOREIGN KEY (`order_seller_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`order_buyer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(30) CHARACTER SET utf8 NOT NULL,
  `product_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `product_seller_id` bigint(20) NOT NULL COMMENT '卖家id与user_id关联',
  `product_price` double(10,2) NOT NULL,
  `product_stock` int(255) NOT NULL,
  `product_taste` char(1) NOT NULL COMMENT '代表辣不辣 0否1是',
  `product_is_sell` char(1) NOT NULL COMMENT '是否上架 0否1是',
  `product_description` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '产品简介',
  `product_picture` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '产品图片',
  `product_hass_selled` int(11) NOT NULL COMMENT '已卖出多少',
  PRIMARY KEY (`product_id`),
  KEY `sell_id` (`product_seller_id`),
  CONSTRAINT `sell_id` FOREIGN KEY (`product_seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '201708186015', '1234', '3', '111.00', '1111', '0', '0', '11111', 'data/images/20170818/1503037352914.jpg', '0');
INSERT INTO `product` VALUES ('2', '2017081885695', '测试', '3', '120.00', '123123', '0', '1', '12321321', 'data/images/20170818/1503037826170.jpg', '0');
INSERT INTO `product` VALUES ('3', '2017081898195', '测试123', '3', '12.00', '1111', '0', '0', '123123', 'data/images/20170818/1503037948374.jpg', '0');
INSERT INTO `product` VALUES ('4', '2017081836389', '测试2', '3', '12.00', '1234', '0', '1', '1234', 'data/images/20170818/1503038177667.jpg', '0');
INSERT INTO `product` VALUES ('5', '2017081881462', '123456', '3', '12.00', '12312', '0', '1', '123', 'data/images/20170818/1503038322957.jpg', '0');

-- ----------------------------
-- Table structure for productimg
-- ----------------------------
DROP TABLE IF EXISTS `productimg`;
CREATE TABLE `productimg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  `beiyong` varchar(255) DEFAULT '' COMMENT '备用 可以为空',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='商品图片表';

-- ----------------------------
-- Records of productimg
-- ----------------------------
INSERT INTO `productimg` VALUES ('1', '1', 'data/images/20170818/1503037352914.jpg', '');
INSERT INTO `productimg` VALUES ('2', '2', 'data/images/20170818/1503037352914.jpg', '');
INSERT INTO `productimg` VALUES ('3', '3', 'data/images/20170818/1503037352914.jpg', '');
INSERT INTO `productimg` VALUES ('4', '4', 'data/images/20170818/1503037352914.jpg', '');
INSERT INTO `productimg` VALUES ('5', '5', 'data/images/20170818/1503037352914.jpg', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `user_password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_nickname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `user_realname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_rol` char(1) CHARACTER SET utf8 NOT NULL COMMENT '0买1卖',
  `user_sex` char(1) CHARACTER SET utf8 NOT NULL COMMENT '0女1男',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '694058774@qq.com', 'qianmo220', '大锤', '黄光旭', '18239454142', '1', '1');
INSERT INTO `user` VALUES ('2', '123@qq.com', 'qianmo220', '王大成', '称大王', '12345678901', '1', '1');
INSERT INTO `user` VALUES ('3', '456@qq.com', 'qianmo220', 'sada', 'sadas', '11111111111', '1', '1');
