/*
Navicat MySQL Data Transfer

Source Server         : localhsot
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : mall_true

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-22 16:13:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for table1
-- ----------------------------
DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `Pid` int(11) DEFAULT NULL COMMENT '父编号',
  `Rid` int(11) DEFAULT NULL COMMENT '关联编号',
  `Name` varchar(1000) DEFAULT NULL COMMENT '名称',
  `Memo` varchar(100) DEFAULT NULL COMMENT '注释',
  `TypeName` varchar(100) DEFAULT NULL COMMENT '类名',
  `CreatorId` int(11) DEFAULT NULL COMMENT '创建人编号',
  `CreatorName` varchar(4000) DEFAULT NULL COMMENT '创建人姓名',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `DataLevel` tinyint(4) DEFAULT NULL COMMENT '数据级别 0正常 1审核中 2被否决 -1已删除 -2草稿',
  `OrderNo` double DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据表1';

-- ----------------------------
-- Records of table1
-- ----------------------------

-- ----------------------------
-- Table structure for test_time
-- ----------------------------
DROP TABLE IF EXISTS `test_time`;
CREATE TABLE `test_time` (
  `shj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_time
-- ----------------------------
INSERT INTO `test_time` VALUES ('2017-10-10 12:15:18', '1');
INSERT INTO `test_time` VALUES ('2017-10-10 12:15:27', '2');

-- ----------------------------
-- Table structure for t_mall_act
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_act`;
CREATE TABLE `t_mall_act` (
  `Id` int(11) NOT NULL COMMENT '编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of t_mall_act
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_address
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_address`;
CREATE TABLE `t_mall_address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_dz` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `dzzt` varchar(1) DEFAULT '1' COMMENT '地址状态',
  `yh_id` varchar(100) DEFAULT NULL COMMENT '用户id',
  `shjr` varchar(100) DEFAULT NULL COMMENT '收件人',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of t_mall_address
-- ----------------------------
INSERT INTO `t_mall_address` VALUES ('1', '高老庄', '1', '1', '八戒', '12312312313');
INSERT INTO `t_mall_address` VALUES ('2', '流沙河', '1', '1', '沙僧', '12312312313');
INSERT INTO `t_mall_address` VALUES ('3', '东土大唐', '1', '1', '师傅', '12312312313');
INSERT INTO `t_mall_address` VALUES ('4', 'sfsff', '1', '1', 'sdfsdf', null);
INSERT INTO `t_mall_address` VALUES ('5', '花果山', '1', '6', '猴哥', '123123123123');
INSERT INTO `t_mall_address` VALUES ('6', '天竺寺', '1', '6', '莱哥', '123123123123');

-- ----------------------------
-- Table structure for t_mall_attr
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_attr`;
CREATE TABLE `t_mall_attr` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_mch` varchar(100) DEFAULT NULL COMMENT '属性名称',
  `shfqy` varchar(1) DEFAULT '1' COMMENT '是否启用',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='属性名表';

-- ----------------------------
-- Records of t_mall_attr
-- ----------------------------
INSERT INTO `t_mall_attr` VALUES ('13', '分辨率', '1', '28', '2017-04-12 16:39:25');
INSERT INTO `t_mall_attr` VALUES ('14', '尺寸', '1', '28', '2017-04-12 16:39:25');
INSERT INTO `t_mall_attr` VALUES ('15', '类型', '1', '28', '2017-04-12 16:39:25');
INSERT INTO `t_mall_attr` VALUES ('16', '色差', '1', '28', '2017-04-12 16:39:25');
INSERT INTO `t_mall_attr` VALUES ('17', '功耗', '1', '28', '2017-04-12 16:39:25');
INSERT INTO `t_mall_attr` VALUES ('18', '螺旋桨', '1', '54', '2017-04-12 17:36:49');
INSERT INTO `t_mall_attr` VALUES ('19', '发动机', '1', '54', '2017-04-12 17:36:49');
INSERT INTO `t_mall_attr` VALUES ('20', '拍摄像素', '1', '54', '2017-04-12 17:36:49');
INSERT INTO `t_mall_attr` VALUES ('21', '武器', '1', '54', '2017-04-12 17:36:49');
INSERT INTO `t_mall_attr` VALUES ('22', '体积', '1', '54', '2017-04-12 17:36:49');
INSERT INTO `t_mall_attr` VALUES ('23', '屏幕类型', '1', '28', '2017-04-15 09:06:35');
INSERT INTO `t_mall_attr` VALUES ('24', 'VR效果', '1', '28', '2017-06-30 15:59:36');
INSERT INTO `t_mall_attr` VALUES ('25', '显宽', '1', '28', '2017-09-14 10:55:34');
INSERT INTO `t_mall_attr` VALUES ('26', '显高', '1', '28', '2017-09-14 10:55:57');
INSERT INTO `t_mall_attr` VALUES ('29', '显宽', '1', '28', '2017-09-14 10:59:44');
INSERT INTO `t_mall_attr` VALUES ('30', '显高', '1', '28', '2017-09-14 10:59:44');
INSERT INTO `t_mall_attr` VALUES ('31', '显宽', '1', '28', '2017-09-14 11:00:11');
INSERT INTO `t_mall_attr` VALUES ('32', '显高', '1', '28', '2017-09-14 11:00:27');
INSERT INTO `t_mall_attr` VALUES ('33', '内存', '1', '17', '2017-10-11 12:01:04');
INSERT INTO `t_mall_attr` VALUES ('34', '处理器', '1', '17', '2017-10-11 12:01:05');
INSERT INTO `t_mall_attr` VALUES ('35', '游戏本属性1', '1', '17', '2017-10-11 12:05:23');
INSERT INTO `t_mall_attr` VALUES ('36', '游戏本属性2', '1', '17', '2017-10-11 12:06:01');
INSERT INTO `t_mall_attr` VALUES ('37', '速度', '1', '29', '2017-11-01 17:06:31');
INSERT INTO `t_mall_attr` VALUES ('38', '滚轮', '1', '29', '2017-11-01 17:07:58');
INSERT INTO `t_mall_attr` VALUES ('39', '123', '1', '15', '2017-11-22 20:02:06');
INSERT INTO `t_mall_attr` VALUES ('40', '123', '1', '15', '2017-11-22 20:02:06');
INSERT INTO `t_mall_attr` VALUES ('41', '123123', '1', '15', '2017-11-22 20:05:40');
INSERT INTO `t_mall_attr` VALUES ('42', '123', '1', '15', '2017-11-22 20:05:40');
INSERT INTO `t_mall_attr` VALUES ('43', '身高', '1', '55', '2017-11-25 16:35:44');
INSERT INTO `t_mall_attr` VALUES ('44', '体重', '1', '55', '2017-11-25 16:35:44');
INSERT INTO `t_mall_attr` VALUES ('45', '特别属性1', '1', '28', '2017-11-28 08:52:04');
INSERT INTO `t_mall_attr` VALUES ('46', '特别属性2', '1', '28', '2017-11-28 08:52:04');
INSERT INTO `t_mall_attr` VALUES ('47', '三位', '1', '55', '2017-11-28 08:58:02');
INSERT INTO `t_mall_attr` VALUES ('48', '颜值', '1', '55', '2017-11-28 08:58:03');
INSERT INTO `t_mall_attr` VALUES ('49', null, '1', '12', '2017-11-29 11:53:29');
INSERT INTO `t_mall_attr` VALUES ('50', null, '1', '12', '2017-11-29 11:53:29');
INSERT INTO `t_mall_attr` VALUES ('51', 'vfvf', '1', '0', '2018-01-22 16:01:35');
INSERT INTO `t_mall_attr` VALUES ('52', 'gt', '1', '0', '2018-01-22 16:04:50');
INSERT INTO `t_mall_attr` VALUES ('53', 'gtt', '1', '0', '2018-01-22 16:04:50');

-- ----------------------------
-- Table structure for t_mall_ck_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_ck_info`;
CREATE TABLE `t_mall_ck_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `ck_mch` varchar(100) DEFAULT NULL COMMENT '仓库名称',
  `ck_dz` varchar(100) DEFAULT NULL COMMENT '仓库地址',
  `ck_lx` varchar(1) DEFAULT NULL COMMENT '仓库类型',
  `ck_mj` double DEFAULT NULL COMMENT '占地面积',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

-- ----------------------------
-- Records of t_mall_ck_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_class_1
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_class_1`;
CREATE TABLE `t_mall_class_1` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flmch1` varchar(11) DEFAULT NULL COMMENT '分类名称1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='分类1表';

-- ----------------------------
-- Records of t_mall_class_1
-- ----------------------------
INSERT INTO `t_mall_class_1` VALUES ('6', '服装鞋帽');
INSERT INTO `t_mall_class_1` VALUES ('7', '家用电器');
INSERT INTO `t_mall_class_1` VALUES ('8', '电脑办公');
INSERT INTO `t_mall_class_1` VALUES ('9', '清洁用品');
INSERT INTO `t_mall_class_1` VALUES ('10', '母婴玩具');
INSERT INTO `t_mall_class_1` VALUES ('11', '手机数码');
INSERT INTO `t_mall_class_1` VALUES ('12', '图书音像');
INSERT INTO `t_mall_class_1` VALUES ('13', '鞋靴箱包');
INSERT INTO `t_mall_class_1` VALUES ('14', '户外钟表');
INSERT INTO `t_mall_class_1` VALUES ('15', '食品烟酒');

-- ----------------------------
-- Table structure for t_mall_class_2
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_class_2`;
CREATE TABLE `t_mall_class_2` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flmch2` varchar(4000) DEFAULT NULL COMMENT '分类名称2',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='分类2表';

-- ----------------------------
-- Records of t_mall_class_2
-- ----------------------------
INSERT INTO `t_mall_class_2` VALUES ('11', '男装', '6');
INSERT INTO `t_mall_class_2` VALUES ('12', '女装', '6');
INSERT INTO `t_mall_class_2` VALUES ('13', '童装', '6');
INSERT INTO `t_mall_class_2` VALUES ('14', '冰箱', '7');
INSERT INTO `t_mall_class_2` VALUES ('15', '洗衣机', '7');
INSERT INTO `t_mall_class_2` VALUES ('16', '笔记本', '8');
INSERT INTO `t_mall_class_2` VALUES ('17', '游戏本', '8');
INSERT INTO `t_mall_class_2` VALUES ('18', '洗发', '9');
INSERT INTO `t_mall_class_2` VALUES ('19', '护肤', '9');
INSERT INTO `t_mall_class_2` VALUES ('20', '牙膏牙刷', '9');
INSERT INTO `t_mall_class_2` VALUES ('21', '内衣', '6');
INSERT INTO `t_mall_class_2` VALUES ('22', '配饰', '6');
INSERT INTO `t_mall_class_2` VALUES ('23', '电视', '7');
INSERT INTO `t_mall_class_2` VALUES ('24', '空调', '7');
INSERT INTO `t_mall_class_2` VALUES ('25', '手机', '11');
INSERT INTO `t_mall_class_2` VALUES ('26', '数码相机', '11');
INSERT INTO `t_mall_class_2` VALUES ('27', '耳机', '11');
INSERT INTO `t_mall_class_2` VALUES ('28', '显示器', '8');
INSERT INTO `t_mall_class_2` VALUES ('29', '鼠标', '8');
INSERT INTO `t_mall_class_2` VALUES ('30', '键盘', '8');
INSERT INTO `t_mall_class_2` VALUES ('31', '路由器', '8');
INSERT INTO `t_mall_class_2` VALUES ('32', '平板电脑', '8');
INSERT INTO `t_mall_class_2` VALUES ('33', '时尚女鞋', '13');
INSERT INTO `t_mall_class_2` VALUES ('34', '流行男鞋', '13');
INSERT INTO `t_mall_class_2` VALUES ('35', '箱包', '13');
INSERT INTO `t_mall_class_2` VALUES ('36', '音箱', '12');
INSERT INTO `t_mall_class_2` VALUES ('37', '教材', '12');
INSERT INTO `t_mall_class_2` VALUES ('38', '杂志', '12');
INSERT INTO `t_mall_class_2` VALUES ('39', '电子书', '12');
INSERT INTO `t_mall_class_2` VALUES ('40', '科学纪录片', '12');
INSERT INTO `t_mall_class_2` VALUES ('41', '游戏机', '11');
INSERT INTO `t_mall_class_2` VALUES ('42', '奶粉', '10');
INSERT INTO `t_mall_class_2` VALUES ('43', '玩具', '10');
INSERT INTO `t_mall_class_2` VALUES ('44', '婴儿车', '10');
INSERT INTO `t_mall_class_2` VALUES ('45', '乐器', '10');
INSERT INTO `t_mall_class_2` VALUES ('46', '跑步机', '14');
INSERT INTO `t_mall_class_2` VALUES ('47', '钟表', '14');
INSERT INTO `t_mall_class_2` VALUES ('48', '球类', '14');
INSERT INTO `t_mall_class_2` VALUES ('49', '乐器', '14');
INSERT INTO `t_mall_class_2` VALUES ('50', '钓鱼用品', '14');
INSERT INTO `t_mall_class_2` VALUES ('51', '水果', '15');
INSERT INTO `t_mall_class_2` VALUES ('52', '中外名酒', '15');
INSERT INTO `t_mall_class_2` VALUES ('53', '茶类', '15');
INSERT INTO `t_mall_class_2` VALUES ('54', '飞机', '7');
INSERT INTO `t_mall_class_2` VALUES ('55', '其他', '7');

-- ----------------------------
-- Table structure for t_mall_class_test
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_class_test`;
CREATE TABLE `t_mall_class_test` (
  `Id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `flmch1` varchar(11) DEFAULT NULL COMMENT '分类名称1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mall_class_test
-- ----------------------------
INSERT INTO `t_mall_class_test` VALUES ('6', '服装鞋帽');
INSERT INTO `t_mall_class_test` VALUES ('7', '家用电器');
INSERT INTO `t_mall_class_test` VALUES ('8', '电脑办公');
INSERT INTO `t_mall_class_test` VALUES ('9', '清洁用品');
INSERT INTO `t_mall_class_test` VALUES ('10', '母婴玩具');
INSERT INTO `t_mall_class_test` VALUES ('11', '手机数码');
INSERT INTO `t_mall_class_test` VALUES ('12', '图书音像');
INSERT INTO `t_mall_class_test` VALUES ('13', '鞋靴箱包');
INSERT INTO `t_mall_class_test` VALUES ('14', '户外钟表');
INSERT INTO `t_mall_class_test` VALUES ('15', '食品烟酒');
INSERT INTO `t_mall_class_test` VALUES ('6', '服装鞋帽');
INSERT INTO `t_mall_class_test` VALUES ('7', '家用电器');
INSERT INTO `t_mall_class_test` VALUES ('8', '电脑办公');
INSERT INTO `t_mall_class_test` VALUES ('9', '清洁用品');
INSERT INTO `t_mall_class_test` VALUES ('10', '母婴玩具');
INSERT INTO `t_mall_class_test` VALUES ('11', '手机数码');
INSERT INTO `t_mall_class_test` VALUES ('12', '图书音像');
INSERT INTO `t_mall_class_test` VALUES ('13', '鞋靴箱包');
INSERT INTO `t_mall_class_test` VALUES ('14', '户外钟表');
INSERT INTO `t_mall_class_test` VALUES ('15', '食品烟酒');

-- ----------------------------
-- Table structure for t_mall_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_comment_image`;
CREATE TABLE `t_mall_comment_image` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `pl_id` int(11) DEFAULT NULL COMMENT '评论id',
  `url` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `chjshj` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论图片表';

-- ----------------------------
-- Records of t_mall_comment_image
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_flow`;
CREATE TABLE `t_mall_flow` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `psfsh` varchar(100) DEFAULT '硅谷快递' COMMENT '配送方式',
  `psshj` datetime DEFAULT NULL COMMENT '配送时间',
  `psmsh` varchar(100) DEFAULT NULL COMMENT '配送描述',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `mqdd` varchar(100) DEFAULT '尚未出库' COMMENT '目前地点',
  `mdd` varchar(100) DEFAULT NULL COMMENT '目的地',
  `ywy` varchar(100) DEFAULT NULL COMMENT '业务员',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='物流表';

-- ----------------------------
-- Records of t_mall_flow
-- ----------------------------
INSERT INTO `t_mall_flow` VALUES ('14', '硅谷快递', null, null, '6', '2017-11-14 15:12:06', '11', '商品未出库', null, null, null);
INSERT INTO `t_mall_flow` VALUES ('15', '硅谷快递', '2017-11-15 16:12:37', '商品准备发货', '6', '2017-11-14 16:11:39', '12', '商品未出库', null, '老佟', '123123123123');
INSERT INTO `t_mall_flow` VALUES ('16', '硅谷快递', null, null, '6', '2017-11-14 16:13:40', '13', '商品未出库', null, null, null);
INSERT INTO `t_mall_flow` VALUES ('17', '硅谷快递', null, null, '6', '2017-11-14 16:14:20', '14', '商品未出库', null, null, null);
INSERT INTO `t_mall_flow` VALUES ('18', '硅谷快递', '2017-11-15 16:15:44', '商品准备发货', '6', '2017-11-14 16:15:21', '15', '商品未出库', null, '老佟', '123123123123');
INSERT INTO `t_mall_flow` VALUES ('19', '硅谷快递', null, null, '1', '2017-11-28 09:05:02', '16', '商品未出库', null, null, null);

-- ----------------------------
-- Table structure for t_mall_flow_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_flow_info`;
CREATE TABLE `t_mall_flow_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流信息表';

-- ----------------------------
-- Records of t_mall_flow_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_minicar
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_minicar`;
CREATE TABLE `t_mall_minicar` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='迷你购物车';

-- ----------------------------
-- Records of t_mall_minicar
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order`;
CREATE TABLE `t_mall_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shhr` varchar(100) DEFAULT NULL COMMENT '收货人',
  `zje` decimal(10,0) DEFAULT NULL COMMENT '总金额',
  `jdh` int(11) DEFAULT '1' COMMENT '进度号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yjsdshj` datetime DEFAULT NULL COMMENT '预计送达时间',
  `dzh_id` int(11) DEFAULT NULL COMMENT '地址id',
  `dzh_mch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='订单表 订单表';

-- ----------------------------
-- Records of t_mall_order
-- ----------------------------
INSERT INTO `t_mall_order` VALUES ('11', '猴哥', '9999', '2', '6', '2017-11-14 15:12:05', '2017-11-17 15:12:14', '5', '花果山');
INSERT INTO `t_mall_order` VALUES ('12', '猴哥', '3555', '2', '6', '2017-11-14 16:11:39', '2017-11-17 16:11:40', '5', '花果山');
INSERT INTO `t_mall_order` VALUES ('13', '猴哥', '9999', '1', '6', '2017-11-14 16:13:40', null, '5', '花果山');
INSERT INTO `t_mall_order` VALUES ('14', '猴哥', '9999', '1', '6', '2017-11-14 16:14:20', null, '5', '花果山');
INSERT INTO `t_mall_order` VALUES ('15', '猴哥', '9999', '2', '6', '2017-11-14 16:15:21', '2017-11-17 16:15:23', '5', '花果山');
INSERT INTO `t_mall_order` VALUES ('16', '师傅', '9999', '1', '1', '2017-11-28 09:05:02', null, '3', '东土大唐');

-- ----------------------------
-- Table structure for t_mall_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order_info`;
CREATE TABLE `t_mall_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dd_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sku_mch` varchar(255) DEFAULT NULL,
  `shp_tp` varchar(255) DEFAULT NULL,
  `sku_jg` decimal(10,0) DEFAULT NULL,
  `sku_shl` int(11) DEFAULT NULL,
  `sku_kcdz` varchar(255) DEFAULT NULL,
  `flow_id` int(11) DEFAULT NULL COMMENT '物流id',
  `gwch_id` int(11) DEFAULT NULL COMMENT '购物车id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of t_mall_order_info
-- ----------------------------
INSERT INTO `t_mall_order_info` VALUES ('19', null, '1', '2017-11-14 15:12:06', '小明联想低端配置系列显示器14寸100瓦功率', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '9999', '1', '昌平区北七家大仓库', '14', '22');
INSERT INTO `t_mall_order_info` VALUES ('20', null, '12', '2017-11-14 16:11:40', '联想低端配置系列显示器24寸200瓦功率', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '3555', '1', '昌平区北七家大仓库', '15', '23');
INSERT INTO `t_mall_order_info` VALUES ('21', null, '1', '2017-11-14 16:13:40', '小明联想低端配置系列显示器14寸100瓦功率', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '9999', '1', '昌平区北七家大仓库', '16', '24');
INSERT INTO `t_mall_order_info` VALUES ('22', null, '1', '2017-11-14 16:14:20', '小明联想低端配置系列显示器14寸100瓦功率', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '9999', '1', '昌平区北七家大仓库', '17', '25');
INSERT INTO `t_mall_order_info` VALUES ('23', null, '1', '2017-11-14 16:15:21', '小明联想低端配置系列显示器14寸100瓦功率', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '9999', '1', '昌平区北七家大仓库', '18', '26');

-- ----------------------------
-- Table structure for t_mall_order_phase
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order_phase`;
CREATE TABLE `t_mall_order_phase` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `jdh` int(11) DEFAULT NULL COMMENT '进度号',
  `jdmsh` varchar(100) DEFAULT NULL COMMENT '进度描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单进度表';

-- ----------------------------
-- Records of t_mall_order_phase
-- ----------------------------
INSERT INTO `t_mall_order_phase` VALUES ('1', '1', '订单已提交');
INSERT INTO `t_mall_order_phase` VALUES ('2', '2', '订单已支付');
INSERT INTO `t_mall_order_phase` VALUES ('3', '3', '运输途中');
INSERT INTO `t_mall_order_phase` VALUES ('4', '4', '订单签收');
INSERT INTO `t_mall_order_phase` VALUES ('5', '5', '完成');

-- ----------------------------
-- Table structure for t_mall_pay_flow_info_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_pay_flow_info_log`;
CREATE TABLE `t_mall_pay_flow_info_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易流水日志表';

-- ----------------------------
-- Records of t_mall_pay_flow_info_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_product
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product`;
CREATE TABLE `t_mall_product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `shp_msh` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_mall_product
-- ----------------------------
INSERT INTO `t_mall_product` VALUES ('6', '联想高端系列显示器', '1491985960210u=1986847822,526015344&fm=23&gp=0.jpg', '8', '28', '2', '2017-04-12 16:32:40', '高配置，土豪的定制，联想高端系列显示器');
INSERT INTO `t_mall_product` VALUES ('7', '联想中低端系列显示器', '1491986072915u=3073007440,1268514512&fm=23&gp=0.jpg', '8', '28', '2', '2017-04-12 16:34:32', '高性价比，高配置，老百姓的首选');
INSERT INTO `t_mall_product` VALUES ('8', '联想低端系列显示器', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '8', '28', '2', '2017-04-12 16:35:38', '低价格，很贴心，有品质');
INSERT INTO `t_mall_product` VALUES ('9', '华为I系列纯平显示器', '1492090141522u=3279637596,1383743164&fm=23&gp=0.jpg', '8', '28', '18', '2017-04-13 21:29:01', '华为品牌，中国品质');
INSERT INTO `t_mall_product` VALUES ('10', '华为III系列纯平显示器', '1492090185160u=1986847822,526015344&fm=23&gp=0.jpg', '8', '28', '18', '2017-04-13 21:29:45', '华为品牌，中国品质,III系列');
INSERT INTO `t_mall_product` VALUES ('11', '华为II系列纯平显示器', '1492090266105u=4230786066,21615376&fm=23&gp=0.jpg', '8', '16', '18', '2017-04-13 21:31:06', '华为品牌，中国品质');
INSERT INTO `t_mall_product` VALUES ('12', '外星人高端配置显示器', '1492090350000u=1238273040,2060575675&fm=23&gp=0.jpg', '8', '28', '20', '2017-04-13 21:32:30', '外星人，高配置高价格');
INSERT INTO `t_mall_product` VALUES ('13', '小米II系列无人机', '1492090457217u=2462024849,196539317&fm=23&gp=0.jpg', '7', '54', '8', '2017-04-13 21:34:17', '小米无人机，最黑黑科技');
INSERT INTO `t_mall_product` VALUES ('14', '美的Midea无人机', '1492090512844u=536484099,1677243497&fm=23&gp=0.jpg', '7', '54', '22', '2017-04-13 21:35:12', '美的Midea无人机,除了空调还有无人机');
INSERT INTO `t_mall_product` VALUES ('15', '联想测试冰箱', '1505276771919c.jpg', '7', '15', '2', '2017-09-13 12:26:21', 'sadfsafdsfdsfasf');
INSERT INTO `t_mall_product` VALUES ('16', '联想测试冰箱', '1505276863185c.jpg', '7', '15', '2', '2017-09-13 12:27:43', 'sadfsafdsfdsfasf');
INSERT INTO `t_mall_product` VALUES ('17', '联想测试冰箱', '1505277080085index.jpg', '7', '15', '2', '2017-09-13 12:31:20', 'asdasd');
INSERT INTO `t_mall_product` VALUES ('18', '联想测试冰箱', '1505277460886c.jpg', '7', '15', '2', '2017-09-13 12:37:41', 'sdfsdfsd');
INSERT INTO `t_mall_product` VALUES ('19', '联想测试冰箱', '1505277578740index.jpg', '7', '15', '2', '2017-09-13 12:39:39', 'sdfsadf');
INSERT INTO `t_mall_product` VALUES ('20', '联想测试冰箱', '1505277749019c.jpg', '7', '15', '2', '2017-09-13 12:42:29', 'sadfsfasdf');
INSERT INTO `t_mall_product` VALUES ('21', '测试spu名称', '', '7', '15', '2', '2017-10-27 12:54:02', '啊啊地方都是f');
INSERT INTO `t_mall_product` VALUES ('22', '测试spu名称', '', '7', '15', '2', '2017-10-27 12:56:20', '啊啊地方都是f');
INSERT INTO `t_mall_product` VALUES ('23', '测试联想游戏本1', '', '8', '17', '2', '2017-10-28 23:00:01', '测试联想游戏本1');
INSERT INTO `t_mall_product` VALUES ('24', '测试联想游戏本1', '', '8', '17', '2', '2017-10-28 23:10:23', '撒旦发射点发');
INSERT INTO `t_mall_product` VALUES ('25', '联想测试i游戏本', '1509440516200bbb.jpg', '8', '17', '2', '2017-10-31 17:02:27', '联想测试i游戏本');
INSERT INTO `t_mall_product` VALUES ('26', '阿斯顿', '1509442392047bbb.jpg', '6', '13', '4', '2017-10-31 17:33:12', '胜多负少');
INSERT INTO `t_mall_product` VALUES ('27', '阿斯顿', '1509442434888ccc.jpg', '9', '20', '10', '2017-10-31 17:33:55', 'sarf ');
INSERT INTO `t_mall_product` VALUES ('28', '阿斯顿', '1509442646830bbb.jpg', '7', '23', '2', '2017-10-31 17:37:27', 'fasdf ');
INSERT INTO `t_mall_product` VALUES ('29', '联想测试游戏本1', '1509531163118bbb.jpg', '8', '17', '2', '2017-11-01 18:12:43', '联想测试游戏本1');
INSERT INTO `t_mall_product` VALUES ('30', '联想测试游戏本2', '1509531186541ddd.jpg', '8', '17', '2', '2017-11-01 18:13:06', '联想测试游戏本2');
INSERT INTO `t_mall_product` VALUES ('31', '随便一个商品', '1509704778747a.gif', '7', '23', '2', '2017-11-03 18:26:18', '随便一个商品');
INSERT INTO `t_mall_product` VALUES ('32', '随便一个商品', '1509704833747a.gif', '7', '24', '18', '2017-11-03 18:27:14', '啊大苏打');
INSERT INTO `t_mall_product` VALUES ('33', '华为abc游戏本', '1509778451705ccc.jpg', '8', '17', '18', '2017-11-04 14:54:11', '华为abc游戏本');
INSERT INTO `t_mall_product` VALUES ('34', '测试商品信息1', '1510540319864a.gif', '7', '15', '2', '2017-11-13 10:32:47', '测试商品信息1');
INSERT INTO `t_mall_product` VALUES ('35', '123123', '1511351811863a.gif', '8', '28', '18', '2017-11-22 19:56:52', '1231313');
INSERT INTO `t_mall_product` VALUES ('36', '华为测试1', '1511519573196a.gif', '8', '17', '18', '2017-11-24 18:32:53', '华为测试1');
INSERT INTO `t_mall_product` VALUES ('37', '美的女友', '1511598809073u=690264292,3421773180&fm=23&gp=0.jpg', '7', '55', '22', '2017-11-25 16:33:29', '美的女友，各种款式可选');
INSERT INTO `t_mall_product` VALUES ('38', '华为人工智能女友', '1511830842318u=2476027798,3173816752&fm=23&gp=0.jpg', '7', '55', '18', '2017-11-28 09:00:42', '华为人工智能女友，好啊');
INSERT INTO `t_mall_product` VALUES ('39', '测试名称1', '1511843095682a.gif', '7', '23', '2', '2017-11-28 12:25:15', '手动阀手动阀');
INSERT INTO `t_mall_product` VALUES ('40', '测试商品5', '1512349685158a.gif', '7', '55', '22', '2017-12-04 09:08:05', '测试商品5');
INSERT INTO `t_mall_product` VALUES ('41', '测试商品5', '1512351028465a.gif', '7', '15', '2', '2017-12-04 09:30:28', 'werwer');

-- ----------------------------
-- Table structure for t_mall_product_color
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_color`;
CREATE TABLE `t_mall_product_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shp_id` int(11) DEFAULT NULL,
  `shp_ys` varchar(100) DEFAULT NULL COMMENT '商品颜色',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mall_product_color
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_comment`;
CREATE TABLE `t_mall_product_comment` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `plnr` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `plshj` datetime DEFAULT NULL COMMENT '平路时间',
  `hpjb` int(11) DEFAULT NULL COMMENT '好评级别',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- ----------------------------
-- Records of t_mall_product_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_product_image
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_image`;
CREATE TABLE `t_mall_product_image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `zy` varchar(100) DEFAULT '1' COMMENT '作用：1头图2列表图3广告图片',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `url` varchar(100) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of t_mall_product_image
-- ----------------------------
INSERT INTO `t_mall_product_image` VALUES ('22', '', '6', '1491985960210u=1986847822,526015344&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('23', '', '6', '1491985960212u=910918644,3968938767&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('24', '', '6', '1491985960215u=697005892,2279856665&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('25', '', '6', '1491985960217u=1829419258,1281228148&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('26', '', '6', '1491985960219u=1986847822,526015344&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('27', '', '7', '14919599201082w1231.jpg');
INSERT INTO `t_mall_product_image` VALUES ('28', '', '7', '1491986072918u=1567465564,365038548&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('29', '', '7', '1491986072920u=1158284051,2123775206&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('30', '', '7', '1491986072923u=2093778323,4064375747&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('31', '', '7', '1491986072926u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('32', '', '8', '149195992011212 (2).jpg');
INSERT INTO `t_mall_product_image` VALUES ('33', '', '8', '1491986138118u=910918644,3968938767&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('34', '', '8', '1491986138120u=2093778323,4064375747&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('35', '', '8', '1491986138123u=697005892,2279856665&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('36', '', '8', '1491986138125u=1567465564,365038548&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('37', '', '9', '1492090141522u=3279637596,1383743164&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('38', '', '9', '1492090141524u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('39', '', '9', '1492090141526u=910918644,3968938767&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('40', '', '9', '1492090141529u=4230786066,21615376&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('41', '', '9', '1491986072915u=3073007440,1268514512&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('42', '', '10', '1492090185160u=1986847822,526015344&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('43', '', '10', '1492090185163u=612772251,2395823516&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('44', '', '10', '1492090185168u=326539897,4239692692&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('45', '', '10', '1492090185170u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('46', '', '10', '1492090185173u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('47', '', '11', '1492090266105u=4230786066,21615376&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('48', '', '11', '1492090266110u=697005892,2279856665&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('49', '', '11', '1492090266114u=326539897,4239692692&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('50', '', '11', '1492090266117u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('51', '', '11', '14919599201082w1231.jpg');
INSERT INTO `t_mall_product_image` VALUES ('52', '', '12', '1492090350000u=1238273040,2060575675&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('53', '', '12', '1492090350003u=612772251,2395823516&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('54', '', '12', '1492090350006u=768317699,2912985599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('55', '', '12', '1492090350009u=326539897,4239692692&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('56', '', '12', '1492090350011u=252043130,4006861356&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('57', '', '13', '1492090457217u=2462024849,196539317&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('58', '', '13', '1492090457219u=128286021,1308925669&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('59', '', '13', '1492090457221u=536484099,1677243497&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('60', '', '13', '1492090457223u=866145389,1046219503&fm=72.jpg');
INSERT INTO `t_mall_product_image` VALUES ('61', '', '13', '1492090457225u=209986129,198077049&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('62', '', '14', '1492090512844u=536484099,1677243497&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('63', '', '14', '1492090512847u=128286021,1308925669&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('64', '', '14', '1492090512849u=866145389,1046219503&fm=72.jpg');
INSERT INTO `t_mall_product_image` VALUES ('65', '', '14', '1492090512852u=536484099,1677243497&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('66', '', '14', '1492090512854');
INSERT INTO `t_mall_product_image` VALUES ('67', '1', '15', '1505276771919c.jpg');
INSERT INTO `t_mall_product_image` VALUES ('68', '1', '15', '1505276771921u=1897777990,21039689&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('69', '1', '15', '1505276771946index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('70', '1', '16', '1505276863185c.jpg');
INSERT INTO `t_mall_product_image` VALUES ('71', '1', '16', '1505276863186u=1897777990,21039689&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('72', '1', '16', '1505276863187index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('73', '1', '17', '1505277080085index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('74', '1', '17', '1505277080086u=867133057,170455639&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('75', '1', '17', '1505277080087');
INSERT INTO `t_mall_product_image` VALUES ('76', '1', '18', '1505277460886c.jpg');
INSERT INTO `t_mall_product_image` VALUES ('77', '1', '19', '1505277578740index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('78', '1', '19', '1505277578742u=1897777990,21039689&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('79', '1', '20', '1505277749019c.jpg');
INSERT INTO `t_mall_product_image` VALUES ('80', '1', '20', '1505277749022index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('81', '1', '21', '1507609265475a.gif');
INSERT INTO `t_mall_product_image` VALUES ('82', '1', '21', '1507609265479a.gif');
INSERT INTO `t_mall_product_image` VALUES ('83', '1', '21', '1507609265481a.gif');
INSERT INTO `t_mall_product_image` VALUES ('84', '1', '22', '1507609379643a.gif');
INSERT INTO `t_mall_product_image` VALUES ('85', '1', '22', '1507609379654a.gif');
INSERT INTO `t_mall_product_image` VALUES ('86', '1', '22', '1507609379658a.gif');
INSERT INTO `t_mall_product_image` VALUES ('87', '1', '23', '1507870193544');
INSERT INTO `t_mall_product_image` VALUES ('88', '1', '24', '1507870322161');
INSERT INTO `t_mall_product_image` VALUES ('89', '1', '25', '1509440516200bbb.jpg');
INSERT INTO `t_mall_product_image` VALUES ('90', '1', '25', '1509440516201ddd.jpg');
INSERT INTO `t_mall_product_image` VALUES ('91', '1', '25', '1509440516202indexss.jpg');
INSERT INTO `t_mall_product_image` VALUES ('92', '1', '26', '1509442392047bbb.jpg');
INSERT INTO `t_mall_product_image` VALUES ('93', '1', '26', '1509442392048index.jpg');
INSERT INTO `t_mall_product_image` VALUES ('94', '1', '26', '1509442392050ddd.jpg');
INSERT INTO `t_mall_product_image` VALUES ('95', '1', '27', '1509442434888ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('96', '1', '28', '1509442646830bbb.jpg');
INSERT INTO `t_mall_product_image` VALUES ('97', '1', '29', '1509531163118bbb.jpg');
INSERT INTO `t_mall_product_image` VALUES ('98', '1', '29', '1509531163120ddd.jpg');
INSERT INTO `t_mall_product_image` VALUES ('99', '1', '29', '1509531163122indexss.jpg');
INSERT INTO `t_mall_product_image` VALUES ('100', '1', '29', '1509531163124u=2004120076,3055615118&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('101', '1', '29', '1509531163125ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('102', '1', '30', '1509531186541ddd.jpg');
INSERT INTO `t_mall_product_image` VALUES ('103', '1', '30', '1509531186542u=2788266912,1008059520&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('104', '1', '30', '1509531186542index2.jpg');
INSERT INTO `t_mall_product_image` VALUES ('105', '1', '30', '1509531186543u=680655970,999056049&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('106', '1', '30', '1509531186544ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('107', '1', '31', '1509704778747a.gif');
INSERT INTO `t_mall_product_image` VALUES ('108', '1', '31', '1509704778748a.gif');
INSERT INTO `t_mall_product_image` VALUES ('109', '1', '31', '1509704778749a.gif');
INSERT INTO `t_mall_product_image` VALUES ('110', '1', '31', '1509704778750a.gif');
INSERT INTO `t_mall_product_image` VALUES ('111', '1', '32', '1509704833747a.gif');
INSERT INTO `t_mall_product_image` VALUES ('112', '1', '32', '1509704833749a.gif');
INSERT INTO `t_mall_product_image` VALUES ('113', '1', '33', '1509778451705ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('114', '1', '33', '1509778451707indexss.jpg');
INSERT INTO `t_mall_product_image` VALUES ('115', '1', '33', '1509778451708u=2004120076,3055615118&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('116', '1', '33', '1509778451709aaa.jpg');
INSERT INTO `t_mall_product_image` VALUES ('117', '1', '34', '1510540319864a.gif');
INSERT INTO `t_mall_product_image` VALUES ('118', '1', '34', '1510540319866a.gif');
INSERT INTO `t_mall_product_image` VALUES ('119', '1', '34', '1510540319867a.gif');
INSERT INTO `t_mall_product_image` VALUES ('120', '1', '35', '1511351811863a.gif');
INSERT INTO `t_mall_product_image` VALUES ('121', '1', '36', '1511519573196a.gif');
INSERT INTO `t_mall_product_image` VALUES ('122', '1', '36', '1511519573198a.gif');
INSERT INTO `t_mall_product_image` VALUES ('123', '1', '36', '1511519573199a.gif');
INSERT INTO `t_mall_product_image` VALUES ('124', '1', '36', '1511519573200a.gif');
INSERT INTO `t_mall_product_image` VALUES ('125', '1', '37', '1511598809073u=690264292,3421773180&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('126', '1', '37', '1511598809132u=700768882,1204720653&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('127', '1', '37', '1511598809133u=3160163537,1290226115&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('128', '1', '37', '1511598809135u=3001215687,2293636599&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('129', '1', '37', '1511598809137u=4116505385,2387833853&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('130', '1', '38', '1511830842318u=2476027798,3173816752&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('131', '1', '38', '1511830842321u=3056370441,346208743&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('132', '1', '38', '1511830842322u=1918711925,4053975140&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('133', '1', '38', '1511830842323u=3243114574,1688598941&fm=23&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('134', '1', '39', '1511843095682a.gif');
INSERT INTO `t_mall_product_image` VALUES ('135', '1', '39', '1511843095695a.gif');
INSERT INTO `t_mall_product_image` VALUES ('136', '1', '39', '1511843095697a.gif');
INSERT INTO `t_mall_product_image` VALUES ('137', '1', '40', '1512349685158a.gif');
INSERT INTO `t_mall_product_image` VALUES ('138', '1', '40', '1512349685162a.gif');
INSERT INTO `t_mall_product_image` VALUES ('139', '1', '41', '1512351028465a.gif');

-- ----------------------------
-- Table structure for t_mall_product_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_sku_info`;
CREATE TABLE `t_mall_product_sku_info` (
  `sku_id` int(11) NOT NULL,
  `shp_msh` varchar(4000) DEFAULT '暂无描述' COMMENT '商品描述',
  `shp_lb` varchar(100) DEFAULT NULL COMMENT '商品类别',
  `pp_id` int(100) DEFAULT NULL COMMENT '商品品牌',
  `shpz_zhl` double(11,0) DEFAULT '0' COMMENT '商品重量',
  `shp_chc` double DEFAULT NULL COMMENT '商品尺寸',
  `shp_ys` int(100) NOT NULL DEFAULT '0',
  `shp_bb` int(100) NOT NULL DEFAULT '0',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shp_ys`,`shp_bb`),
  UNIQUE KEY `sku_id_unique` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品基本信息表';

-- ----------------------------
-- Records of t_mall_product_sku_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_product_version
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_version`;
CREATE TABLE `t_mall_product_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shp_id` int(11) DEFAULT NULL,
  `shp_bb` varchar(100) DEFAULT NULL COMMENT '商品版本',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mall_product_version
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_redis_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_redis_log`;
CREATE TABLE `t_mall_redis_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缓存日志表';

-- ----------------------------
-- Records of t_mall_redis_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_search_info_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_search_info_log`;
CREATE TABLE `t_mall_search_info_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品检索日志表';

-- ----------------------------
-- Records of t_mall_search_info_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_shoppingcar`;
CREATE TABLE `t_mall_shoppingcar` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_jg` decimal(10,0) DEFAULT NULL COMMENT 'sku价格',
  `tjshl` int(11) DEFAULT NULL COMMENT '添加数量',
  `hj` decimal(10,0) DEFAULT NULL COMMENT '合计',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `shfxz` varchar(1) DEFAULT '1' COMMENT '是否选中',
  `kcdz` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of t_mall_shoppingcar
-- ----------------------------
INSERT INTO `t_mall_shoppingcar` VALUES ('1', '小明联想低端配置系列显示器14寸100瓦功率', '9999', '2', '19998', '1', '8', '2017-11-08 14:50:49', '1', '1491986138116u=2528461445,241269007&fm=23&gp=0.jpg', '0', '昌平区北七家大仓库');
INSERT INTO `t_mall_shoppingcar` VALUES ('2', '小明联想中端系列显示器200瓦15寸', '43330', '2', '86660', '1', '7', '2017-11-08 14:51:50', '2', '1491986072915u=3073007440,1268514512&fm=23&gp=0.jpg', '0', '昌平区北七家大仓库');
INSERT INTO `t_mall_shoppingcar` VALUES ('3', '联想高端系列显示器500瓦45寸', '8880', '2', '17760', '1', '6', '2017-11-08 14:52:48', '3', '1491985960210u=1986847822,526015344&fm=23&gp=0.jpg', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_shoppingcar` VALUES ('4', '华为人工智能1', '9999', '1', '9999', '1', '38', '2017-11-28 09:04:41', '37', '1511830842318u=2476027798,3173816752&fm=23&gp=0.jpg', '1', '北京昌平区仓库');

-- ----------------------------
-- Table structure for t_mall_shoppingcar_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_shoppingcar_info`;
CREATE TABLE `t_mall_shoppingcar_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `sku_mch` varchar(4000) DEFAULT NULL COMMENT '名称',
  `sku_jg` int(11) DEFAULT NULL COMMENT 'sku价格',
  `yh_xm` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `yh_nch` varchar(4000) DEFAULT NULL COMMENT '用户昵称',
  `yh_dz` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `sku_kc` int(11) DEFAULT NULL COMMENT 'sku库存',
  `sku_shx` varchar(100) DEFAULT NULL COMMENT 'sku属性',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

-- ----------------------------
-- Records of t_mall_shoppingcar_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_sku`;
CREATE TABLE `t_mall_sku` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_id` int(11) DEFAULT NULL COMMENT '名称',
  `kc` int(11) DEFAULT NULL COMMENT '库存',
  `jg` double DEFAULT NULL COMMENT '价格',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_xl` int(11) DEFAULT NULL COMMENT 'sku销量',
  `kcdz` varchar(500) DEFAULT '昌平区北七家大仓库' COMMENT '库存地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='sku库存表';

-- ----------------------------
-- Records of t_mall_sku
-- ----------------------------
INSERT INTO `t_mall_sku` VALUES ('1', '8', '1', '9996', '2017-04-13 21:36:20', '小明联想低端配置系列显示器14寸100瓦功率', '24', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('2', '7', '0', '43330', '2017-04-13 21:44:56', '小明联想中端系列显示器200瓦15寸', '7', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('3', '6', '1', '8880', '2017-04-13 21:46:19', '联想高端系列显示器500瓦45寸', '7', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('4', '6', '98', '8877', '2017-04-13 21:50:29', '联想高端系列显示器24寸曲面', '101', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('5', '7', '99', '3555', '2017-04-13 21:57:12', '联想中端系列24寸非曲面显示器', '33', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('6', '9', '100', '3333', '2017-04-13 22:00:59', '华为I系列24寸曲面显示器', '4', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('7', '9', '100', '4555', '2017-04-13 22:01:36', '华为I系列24寸非曲面显示器', '5', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('8', '10', '100', '1555', '2017-04-13 22:02:26', '华为II系列15寸屏幕显示器', '6', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('9', '12', '100', '9999', '2017-04-13 22:03:07', '外星人高分辨率非曲面显示器', '90', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('10', '12', '100', '10000', '2017-04-13 22:03:59', '外星人高分辨率曲面显示器', '23', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('11', '9', '99', '1555', '2017-04-13 22:05:13', '华为I系列15寸非曲面显示器', '901', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('12', '8', '0', '3555', '2017-04-13 22:05:56', '联想低端配置系列显示器24寸200瓦功率', '146', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('13', '13', '100', '20000', '2017-04-13 22:07:03', '小米4驱动II系列无人机', '50', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('14', '14', '100', '3555', '2017-04-13 22:07:39', '美的四轮无人机', '2', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('15', '13', '100', '10000', '2017-04-13 22:08:15', '小米8驱动无人机', '6', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('16', '12', '98', '20000', '2017-04-14 14:15:51', '外星人非曲面高端45寸显示器', '2', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('17', '7', '100', '3555', '2017-04-15 09:13:32', '联想中低端系列LCD显示屏显示屏', '0', '昌平区北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('18', '12', '89', '1000', '2017-05-06 14:39:45', '外星人iso屏幕显示器', '1', '昌平区北七家上硅谷');
INSERT INTO `t_mall_sku` VALUES ('19', '7', '11', '2222', '2017-05-28 10:52:48', '联想一级系列显示器省钱王', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('20', '8', '11', '2222', '2017-05-28 10:55:35', '联想一级系列显示器省钱王2', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('21', '12', '11', '2222', '2017-05-28 11:02:33', '外星人一级系列显示器省钱王', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('22', '10', '11', '123123', '2017-05-28 11:08:29', '华为一级系列显示器省钱王', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('23', '12', '11', '123123', '2017-05-28 11:13:45', '外星人一级系列显示器省钱王2', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('24', '12', '9', '10001', '2017-06-30 16:00:42', '外星人全景vr高端显示器', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('25', '10', '1', '6000', '2017-09-16 08:47:22', '华为III系列高配置分辨率显示屏', '0', '北京天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('26', '7', '123', '3333', '2017-09-16 12:03:38', '联想III系列高配置分辨率显示屏', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('27', '10', '1', '6000', '2017-09-16 12:15:58', '华为III系列高配置分辨率显示屏', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('28', '10', '1', '6000', '2017-09-16 12:17:05', '华为III系列高配置分辨率显示屏', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('29', '6', '1', '6000', '2017-09-16 12:18:23', '联想III系列高配置分辨率显示屏', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('30', '7', '123', '300', '2017-10-13 09:36:03', '联想测试显示器1', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('31', '21', '123', '9000', '2017-10-29 10:13:18', '测试库存名称', null, '测试库存地址名称');
INSERT INTO `t_mall_sku` VALUES ('32', '10', '123', '123', '2017-11-22 19:28:14', '123', null, '123');
INSERT INTO `t_mall_sku` VALUES ('33', '9', '123', '123', '2017-11-22 20:20:54', '123', null, '123');
INSERT INTO `t_mall_sku` VALUES ('34', '8', '123', '2', '2017-11-24 16:08:15', '测试产品1', null, '天意小商品批发市场');
INSERT INTO `t_mall_sku` VALUES ('35', '37', '1', '10000', '2017-11-25 16:37:04', '张小虎', null, '北七家洪福科技园');
INSERT INTO `t_mall_sku` VALUES ('36', '10', '1', '9999', '2017-11-28 08:55:23', '华为测试三系列特殊属性显示器', null, '北京昌平区仓库');
INSERT INTO `t_mall_sku` VALUES ('37', '38', '1', '9999', '2017-11-28 09:02:13', '华为人工智能1', null, '北京昌平区仓库');
INSERT INTO `t_mall_sku` VALUES ('38', '8', '122', '123', '2017-12-01 09:16:00', '测试商品2', null, '北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('39', '8', '122', '123', '2017-12-01 09:19:14', '测试商品2', null, '北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('40', '7', '122', '123', '2017-12-01 09:19:59', '测试商品2', null, '北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('41', '7', '122', '123', '2017-12-01 09:21:18', '测试商品2', null, '北七家大仓库');
INSERT INTO `t_mall_sku` VALUES ('42', '7', '122', '123', '2017-12-01 09:21:56', '测试商品3', null, '北七家大仓库');

-- ----------------------------
-- Table structure for t_mall_sku_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_sku_attr_value`;
CREATE TABLE `t_mall_sku_attr_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性名id',
  `shxzh_id` int(11) DEFAULT NULL COMMENT '属性值id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `is_sku` varchar(1) DEFAULT '1' COMMENT '是否sku',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='sku属性和属性值关联表';

-- ----------------------------
-- Records of t_mall_sku_attr_value
-- ----------------------------
INSERT INTO `t_mall_sku_attr_value` VALUES ('1', '13', '30', '8', '1', '2017-04-13 21:36:25', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('2', '14', '33', '8', '1', '2017-04-13 21:36:25', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('3', '15', '38', '8', '1', '2017-04-13 21:36:25', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('4', '16', '40', '8', '1', '2017-04-13 21:36:25', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('5', '17', '44', '8', '1', '2017-04-13 21:36:25', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('6', '13', '31', '7', '1', '2017-04-13 21:44:56', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('7', '14', '34', '7', '1', '2017-04-13 21:44:56', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('8', '15', '39', '7', '1', '2017-04-13 21:44:56', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('9', '16', '41', '7', '1', '2017-04-13 21:44:56', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('10', '17', '45', '7', '1', '2017-04-13 21:44:56', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('11', '13', '32', '6', '1', '2017-04-13 21:46:19', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('12', '14', '37', '6', '1', '2017-04-13 21:46:19', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('13', '15', '39', '6', '1', '2017-04-13 21:46:19', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('14', '16', '43', '6', '1', '2017-04-13 21:46:19', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('15', '17', '47', '6', '1', '2017-04-13 21:46:19', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('16', '13', '31', '6', '1', '2017-04-13 21:50:29', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('17', '14', '35', '6', '1', '2017-04-13 21:50:29', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('18', '15', '38', '6', '1', '2017-04-13 21:50:29', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('19', '16', '42', '6', '1', '2017-04-13 21:50:29', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('20', '17', '46', '6', '1', '2017-04-13 21:50:29', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('21', '13', '31', '7', '1', '2017-04-13 21:57:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('22', '14', '35', '7', '1', '2017-04-13 21:57:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('23', '15', '39', '7', '1', '2017-04-13 21:57:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('24', '16', '41', '7', '1', '2017-04-13 21:57:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('25', '17', '45', '7', '1', '2017-04-13 21:57:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('26', '13', '32', '9', '1', '2017-04-13 22:00:59', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('27', '14', '35', '9', '1', '2017-04-13 22:00:59', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('28', '15', '38', '9', '1', '2017-04-13 22:00:59', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('29', '16', '40', '9', '1', '2017-04-13 22:00:59', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('30', '17', '45', '9', '1', '2017-04-13 22:00:59', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('31', '13', '30', '9', '1', '2017-04-13 22:01:36', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('32', '14', '34', '9', '1', '2017-04-13 22:01:36', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('33', '15', '39', '9', '1', '2017-04-13 22:01:36', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('34', '16', '41', '9', '1', '2017-04-13 22:01:36', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('35', '17', '44', '9', '1', '2017-04-13 22:01:36', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('36', '13', '31', '10', '1', '2017-04-13 22:02:26', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('37', '14', '34', '10', '1', '2017-04-13 22:02:26', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('38', '15', '39', '10', '1', '2017-04-13 22:02:26', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('39', '16', '43', '10', '1', '2017-04-13 22:02:26', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('40', '17', '44', '10', '1', '2017-04-13 22:02:26', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('41', '13', '32', '12', '1', '2017-04-13 22:03:07', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('42', '14', '37', '12', '1', '2017-04-13 22:03:07', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('43', '15', '39', '12', '1', '2017-04-13 22:03:07', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('44', '16', '43', '12', '1', '2017-04-13 22:03:07', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('45', '17', '46', '12', '1', '2017-04-13 22:03:07', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('46', '13', '31', '12', '1', '2017-04-13 22:03:59', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('47', '14', '34', '12', '1', '2017-04-13 22:03:59', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('48', '15', '38', '12', '1', '2017-04-13 22:03:59', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('49', '16', '41', '12', '1', '2017-04-13 22:03:59', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('50', '17', '45', '12', '1', '2017-04-13 22:03:59', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('51', '13', '30', '9', '1', '2017-04-13 22:05:13', '11');
INSERT INTO `t_mall_sku_attr_value` VALUES ('52', '14', '34', '9', '1', '2017-04-13 22:05:13', '11');
INSERT INTO `t_mall_sku_attr_value` VALUES ('53', '15', '39', '9', '1', '2017-04-13 22:05:13', '11');
INSERT INTO `t_mall_sku_attr_value` VALUES ('54', '16', '43', '9', '1', '2017-04-13 22:05:13', '11');
INSERT INTO `t_mall_sku_attr_value` VALUES ('55', '17', '46', '9', '1', '2017-04-13 22:05:13', '11');
INSERT INTO `t_mall_sku_attr_value` VALUES ('56', '13', '31', '8', '1', '2017-04-13 22:05:57', '12');
INSERT INTO `t_mall_sku_attr_value` VALUES ('57', '14', '35', '8', '1', '2017-04-13 22:05:57', '12');
INSERT INTO `t_mall_sku_attr_value` VALUES ('58', '15', '38', '8', '1', '2017-04-13 22:05:57', '12');
INSERT INTO `t_mall_sku_attr_value` VALUES ('59', '16', '40', '8', '1', '2017-04-13 22:05:57', '12');
INSERT INTO `t_mall_sku_attr_value` VALUES ('60', '17', '45', '8', '1', '2017-04-13 22:05:57', '12');
INSERT INTO `t_mall_sku_attr_value` VALUES ('61', '18', '48', '13', '1', '2017-04-13 22:07:03', '13');
INSERT INTO `t_mall_sku_attr_value` VALUES ('62', '19', '51', '13', '1', '2017-04-13 22:07:03', '13');
INSERT INTO `t_mall_sku_attr_value` VALUES ('63', '20', '53', '13', '1', '2017-04-13 22:07:03', '13');
INSERT INTO `t_mall_sku_attr_value` VALUES ('64', '21', '56', '13', '1', '2017-04-13 22:07:03', '13');
INSERT INTO `t_mall_sku_attr_value` VALUES ('65', '18', '49', '14', '1', '2017-04-13 22:07:39', '14');
INSERT INTO `t_mall_sku_attr_value` VALUES ('66', '19', '51', '14', '1', '2017-04-13 22:07:39', '14');
INSERT INTO `t_mall_sku_attr_value` VALUES ('67', '20', '53', '14', '1', '2017-04-13 22:07:39', '14');
INSERT INTO `t_mall_sku_attr_value` VALUES ('68', '21', '57', '14', '1', '2017-04-13 22:07:39', '14');
INSERT INTO `t_mall_sku_attr_value` VALUES ('69', '22', '59', '14', '1', '2017-04-13 22:07:39', '14');
INSERT INTO `t_mall_sku_attr_value` VALUES ('70', '18', '48', '13', '1', '2017-04-13 22:08:15', '15');
INSERT INTO `t_mall_sku_attr_value` VALUES ('71', '19', '52', '13', '1', '2017-04-13 22:08:15', '15');
INSERT INTO `t_mall_sku_attr_value` VALUES ('72', '20', '53', '13', '1', '2017-04-13 22:08:15', '15');
INSERT INTO `t_mall_sku_attr_value` VALUES ('73', '21', '56', '13', '1', '2017-04-13 22:08:15', '15');
INSERT INTO `t_mall_sku_attr_value` VALUES ('74', '22', '59', '13', '1', '2017-04-13 22:08:15', '15');
INSERT INTO `t_mall_sku_attr_value` VALUES ('75', '13', '32', '12', '1', '2017-04-14 14:15:51', '16');
INSERT INTO `t_mall_sku_attr_value` VALUES ('76', '14', '37', '12', '1', '2017-04-14 14:15:51', '16');
INSERT INTO `t_mall_sku_attr_value` VALUES ('77', '15', '39', '12', '1', '2017-04-14 14:15:51', '16');
INSERT INTO `t_mall_sku_attr_value` VALUES ('78', '16', '43', '12', '1', '2017-04-14 14:15:51', '16');
INSERT INTO `t_mall_sku_attr_value` VALUES ('79', '13', '30', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('80', '14', '34', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('81', '15', '39', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('82', '16', '42', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('83', '17', '45', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('84', '23', '62', '7', '1', '2017-04-15 09:13:32', '17');
INSERT INTO `t_mall_sku_attr_value` VALUES ('85', '13', '30', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('86', '14', '33', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('87', '15', '38', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('88', '16', '40', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('89', '17', '44', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('90', '23', '63', '12', '1', '2017-05-06 14:39:45', '18');
INSERT INTO `t_mall_sku_attr_value` VALUES ('91', '13', '30', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('92', '14', '33', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('93', '15', '38', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('94', '16', '40', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('95', '17', '44', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('96', '23', '61', '0', '1', '2017-05-28 10:52:48', '19');
INSERT INTO `t_mall_sku_attr_value` VALUES ('97', '13', '30', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('98', '14', '33', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('99', '15', '38', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('100', '16', '40', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('101', '17', '44', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('102', '23', '61', '0', '1', '2017-05-28 10:55:35', '20');
INSERT INTO `t_mall_sku_attr_value` VALUES ('103', '13', '31', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('104', '14', '35', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('105', '15', '39', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('106', '16', '42', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('107', '17', '46', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('108', '23', '62', '0', '1', '2017-05-28 11:02:33', '21');
INSERT INTO `t_mall_sku_attr_value` VALUES ('109', '13', '31', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('110', '14', '34', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('111', '15', '39', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('112', '16', '43', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('113', '17', '47', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('114', '23', '63', '0', '1', '2017-05-28 11:08:29', '22');
INSERT INTO `t_mall_sku_attr_value` VALUES ('115', '13', '30', '0', '1', '2017-05-28 11:13:46', '23');
INSERT INTO `t_mall_sku_attr_value` VALUES ('116', '14', '33', '0', '1', '2017-05-28 11:13:46', '23');
INSERT INTO `t_mall_sku_attr_value` VALUES ('117', '15', '38', '0', '1', '2017-05-28 11:13:46', '23');
INSERT INTO `t_mall_sku_attr_value` VALUES ('118', '16', '40', '0', '1', '2017-05-28 11:13:46', '23');
INSERT INTO `t_mall_sku_attr_value` VALUES ('119', '13', '31', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('120', '14', '34', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('121', '15', '38', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('122', '16', '0', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('123', '17', '45', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('124', '23', '62', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('125', '24', '64', '12', '1', '2017-06-30 16:00:42', '24');
INSERT INTO `t_mall_sku_attr_value` VALUES ('126', '13', '32', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('127', '14', '37', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('128', '15', '39', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('129', '16', '42', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('130', '17', '46', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('131', '23', '62', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('132', '24', '65', '10', '1', '2017-09-16 08:47:53', '25');
INSERT INTO `t_mall_sku_attr_value` VALUES ('133', '13', '30', '7', '1', '2017-09-16 12:03:38', '26');
INSERT INTO `t_mall_sku_attr_value` VALUES ('134', '14', '33', '7', '1', '2017-09-16 12:03:38', '26');
INSERT INTO `t_mall_sku_attr_value` VALUES ('135', '15', '38', '7', '1', '2017-09-16 12:03:38', '26');
INSERT INTO `t_mall_sku_attr_value` VALUES ('136', '16', '40', '7', '1', '2017-09-16 12:03:38', '26');
INSERT INTO `t_mall_sku_attr_value` VALUES ('137', '13', '30', '10', '1', '2017-09-16 12:15:58', '27');
INSERT INTO `t_mall_sku_attr_value` VALUES ('138', '14', '33', '10', '1', '2017-09-16 12:15:58', '27');
INSERT INTO `t_mall_sku_attr_value` VALUES ('139', '13', '30', '10', '1', '2017-09-16 12:17:05', '28');
INSERT INTO `t_mall_sku_attr_value` VALUES ('140', '14', '34', '10', '1', '2017-09-16 12:17:05', '28');
INSERT INTO `t_mall_sku_attr_value` VALUES ('141', '0', '0', '6', '1', '2017-09-16 12:18:23', '29');
INSERT INTO `t_mall_sku_attr_value` VALUES ('142', '14', '33', '6', '1', '2017-09-16 12:18:23', '29');
INSERT INTO `t_mall_sku_attr_value` VALUES ('143', '15', '38', '6', '1', '2017-09-16 12:18:23', '29');
INSERT INTO `t_mall_sku_attr_value` VALUES ('144', '16', '40', '6', '1', '2017-09-16 12:18:23', '29');
INSERT INTO `t_mall_sku_attr_value` VALUES ('145', '13', '30', '7', '1', '2017-10-13 09:36:25', '30');
INSERT INTO `t_mall_sku_attr_value` VALUES ('146', '14', '33', '7', '1', '2017-10-13 09:36:25', '30');
INSERT INTO `t_mall_sku_attr_value` VALUES ('147', '15', '38', '7', '1', '2017-10-13 09:36:25', '30');
INSERT INTO `t_mall_sku_attr_value` VALUES ('148', '33', '78', '21', '1', '2017-10-29 10:13:18', '31');
INSERT INTO `t_mall_sku_attr_value` VALUES ('149', '34', '80', '21', '1', '2017-10-29 10:13:18', '31');
INSERT INTO `t_mall_sku_attr_value` VALUES ('150', '35', '82', '21', '1', '2017-10-29 10:13:18', '31');
INSERT INTO `t_mall_sku_attr_value` VALUES ('151', '36', '84', '21', '1', '2017-10-29 10:13:18', '31');
INSERT INTO `t_mall_sku_attr_value` VALUES ('152', '13', '31', null, '1', '2017-11-22 19:28:15', '32');
INSERT INTO `t_mall_sku_attr_value` VALUES ('153', '14', '35', null, '1', '2017-11-22 19:28:15', '32');
INSERT INTO `t_mall_sku_attr_value` VALUES ('154', '15', '39', null, '1', '2017-11-22 19:28:15', '32');
INSERT INTO `t_mall_sku_attr_value` VALUES ('155', '16', '42', null, '1', '2017-11-22 19:28:15', '32');
INSERT INTO `t_mall_sku_attr_value` VALUES ('156', '13', '32', null, '1', '2017-11-22 20:20:54', '33');
INSERT INTO `t_mall_sku_attr_value` VALUES ('157', '14', '37', null, '1', '2017-11-22 20:20:54', '33');
INSERT INTO `t_mall_sku_attr_value` VALUES ('158', '15', '39', null, '1', '2017-11-22 20:20:54', '33');
INSERT INTO `t_mall_sku_attr_value` VALUES ('159', '16', '43', null, '1', '2017-11-22 20:20:54', '33');
INSERT INTO `t_mall_sku_attr_value` VALUES ('160', '17', '47', null, '1', '2017-11-22 20:20:54', '33');
INSERT INTO `t_mall_sku_attr_value` VALUES ('161', '13', '31', null, '1', '2017-11-24 16:08:15', '34');
INSERT INTO `t_mall_sku_attr_value` VALUES ('162', '14', '34', null, '1', '2017-11-24 16:08:15', '34');
INSERT INTO `t_mall_sku_attr_value` VALUES ('163', '15', '0', null, '1', '2017-11-24 16:08:15', '34');
INSERT INTO `t_mall_sku_attr_value` VALUES ('164', '43', '99', null, '1', '2017-11-25 16:37:04', '35');
INSERT INTO `t_mall_sku_attr_value` VALUES ('165', '44', '101', null, '1', '2017-11-25 16:37:04', '35');
INSERT INTO `t_mall_sku_attr_value` VALUES ('166', '13', '32', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('167', '14', '37', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('168', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('169', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('170', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('171', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('172', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('173', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('174', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('175', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('176', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('177', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('178', '0', '0', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('179', '45', '103', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('180', '46', '105', null, '1', '2017-11-28 08:55:23', '36');
INSERT INTO `t_mall_sku_attr_value` VALUES ('181', '43', '99', null, '1', '2017-11-28 09:02:14', '37');
INSERT INTO `t_mall_sku_attr_value` VALUES ('182', '44', '101', null, '1', '2017-11-28 09:02:14', '37');
INSERT INTO `t_mall_sku_attr_value` VALUES ('183', '47', '107', null, '1', '2017-11-28 09:02:14', '37');
INSERT INTO `t_mall_sku_attr_value` VALUES ('184', '48', '109', null, '1', '2017-11-28 09:02:14', '37');
INSERT INTO `t_mall_sku_attr_value` VALUES ('185', '13', '31', null, '1', '2017-12-01 09:20:05', '40');
INSERT INTO `t_mall_sku_attr_value` VALUES ('186', '14', '35', null, '1', '2017-12-01 09:20:05', '40');
INSERT INTO `t_mall_sku_attr_value` VALUES ('187', '15', '39', null, '1', '2017-12-01 09:20:05', '40');
INSERT INTO `t_mall_sku_attr_value` VALUES ('188', '13', '31', '7', '1', '2017-12-01 09:21:18', '41');
INSERT INTO `t_mall_sku_attr_value` VALUES ('189', '14', '35', '7', '1', '2017-12-01 09:21:18', '41');
INSERT INTO `t_mall_sku_attr_value` VALUES ('190', '15', '39', '7', '1', '2017-12-01 09:21:18', '41');
INSERT INTO `t_mall_sku_attr_value` VALUES ('191', '13', '31', '7', '1', '2017-12-01 09:21:57', '42');
INSERT INTO `t_mall_sku_attr_value` VALUES ('192', '14', '35', '7', '1', '2017-12-01 09:21:57', '42');
INSERT INTO `t_mall_sku_attr_value` VALUES ('193', '15', '39', '7', '1', '2017-12-01 09:21:57', '42');

-- ----------------------------
-- Table structure for t_mall_sku_image
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_sku_image`;
CREATE TABLE `t_mall_sku_image` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `url` varchar(4000) DEFAULT NULL COMMENT '图片',
  `zy` varchar(1) DEFAULT NULL COMMENT '作用',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku图片表';

-- ----------------------------
-- Records of t_mall_sku_image
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_tm_class
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_tm_class`;
CREATE TABLE `t_mall_tm_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='商标分类对应表';

-- ----------------------------
-- Records of t_mall_tm_class
-- ----------------------------
INSERT INTO `t_mall_tm_class` VALUES ('1', '8', '7');
INSERT INTO `t_mall_tm_class` VALUES ('2', '1', '8');
INSERT INTO `t_mall_tm_class` VALUES ('3', '9', '9');
INSERT INTO `t_mall_tm_class` VALUES ('4', '3', '6');
INSERT INTO `t_mall_tm_class` VALUES ('5', '2', '7');
INSERT INTO `t_mall_tm_class` VALUES ('6', '2', '8');
INSERT INTO `t_mall_tm_class` VALUES ('7', '10', '9');
INSERT INTO `t_mall_tm_class` VALUES ('8', '4', '6');
INSERT INTO `t_mall_tm_class` VALUES ('9', '13', '6');
INSERT INTO `t_mall_tm_class` VALUES ('10', '14', '6');
INSERT INTO `t_mall_tm_class` VALUES ('11', '13', '13');
INSERT INTO `t_mall_tm_class` VALUES ('12', '13', '14');
INSERT INTO `t_mall_tm_class` VALUES ('13', '14', '13');
INSERT INTO `t_mall_tm_class` VALUES ('14', '14', '14');
INSERT INTO `t_mall_tm_class` VALUES ('15', '18', '7');
INSERT INTO `t_mall_tm_class` VALUES ('16', '18', '8');
INSERT INTO `t_mall_tm_class` VALUES ('17', '18', '11');
INSERT INTO `t_mall_tm_class` VALUES ('18', '19', '8');
INSERT INTO `t_mall_tm_class` VALUES ('19', '19', '11');
INSERT INTO `t_mall_tm_class` VALUES ('20', '20', '8');
INSERT INTO `t_mall_tm_class` VALUES ('21', '21', '9');
INSERT INTO `t_mall_tm_class` VALUES ('22', '22', '7');
INSERT INTO `t_mall_tm_class` VALUES ('23', '23', '14');
INSERT INTO `t_mall_tm_class` VALUES ('24', '24', '14');
INSERT INTO `t_mall_tm_class` VALUES ('25', '25', '14');
INSERT INTO `t_mall_tm_class` VALUES ('26', '26', '14');
INSERT INTO `t_mall_tm_class` VALUES ('27', '27', '13');
INSERT INTO `t_mall_tm_class` VALUES ('28', '28', '13');
INSERT INTO `t_mall_tm_class` VALUES ('29', '29', '11');
INSERT INTO `t_mall_tm_class` VALUES ('30', '30', '10');
INSERT INTO `t_mall_tm_class` VALUES ('31', '30', '15');
INSERT INTO `t_mall_tm_class` VALUES ('32', '31', '10');
INSERT INTO `t_mall_tm_class` VALUES ('33', '31', '15');
INSERT INTO `t_mall_tm_class` VALUES ('34', '32', '10');
INSERT INTO `t_mall_tm_class` VALUES ('35', '32', '15');

-- ----------------------------
-- Table structure for t_mall_trade_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_trade_mark`;
CREATE TABLE `t_mall_trade_mark` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ppmch` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `url` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='商标表';

-- ----------------------------
-- Records of t_mall_trade_mark
-- ----------------------------
INSERT INTO `t_mall_trade_mark` VALUES ('1', 'apple', null);
INSERT INTO `t_mall_trade_mark` VALUES ('2', 'lenovo', null);
INSERT INTO `t_mall_trade_mark` VALUES ('3', '骆驼', null);
INSERT INTO `t_mall_trade_mark` VALUES ('4', '波司登', null);
INSERT INTO `t_mall_trade_mark` VALUES ('8', '华为', null);
INSERT INTO `t_mall_trade_mark` VALUES ('9', '欧莱雅', null);
INSERT INTO `t_mall_trade_mark` VALUES ('10', '沙宣', null);
INSERT INTO `t_mall_trade_mark` VALUES ('13', '阿迪达斯', null);
INSERT INTO `t_mall_trade_mark` VALUES ('14', '耐克', null);
INSERT INTO `t_mall_trade_mark` VALUES ('18', '华为', null);
INSERT INTO `t_mall_trade_mark` VALUES ('19', '宏基', null);
INSERT INTO `t_mall_trade_mark` VALUES ('20', '外星人', null);
INSERT INTO `t_mall_trade_mark` VALUES ('21', '欧莱雅', null);
INSERT INTO `t_mall_trade_mark` VALUES ('22', '美的Midea', null);
INSERT INTO `t_mall_trade_mark` VALUES ('23', '劳力士', null);
INSERT INTO `t_mall_trade_mark` VALUES ('24', '天梭', null);
INSERT INTO `t_mall_trade_mark` VALUES ('25', '卡地亚Carter', null);
INSERT INTO `t_mall_trade_mark` VALUES ('26', '江诗丹顿', null);
INSERT INTO `t_mall_trade_mark` VALUES ('27', '瑞士军刀', null);
INSERT INTO `t_mall_trade_mark` VALUES ('28', 'LV', null);
INSERT INTO `t_mall_trade_mark` VALUES ('29', '诺基亚', null);
INSERT INTO `t_mall_trade_mark` VALUES ('30', '三鹿', null);
INSERT INTO `t_mall_trade_mark` VALUES ('31', '蒙牛', null);
INSERT INTO `t_mall_trade_mark` VALUES ('32', '伊利', null);

-- ----------------------------
-- Table structure for t_mall_user_account
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_account`;
CREATE TABLE `t_mall_user_account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_mch` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `yh_nch` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `yh_mm` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `yh_xm` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '手机号',
  `yh_yx` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `yh_tx` varchar(100) DEFAULT NULL COMMENT '头像',
  `yh_jb` int(100) DEFAULT NULL COMMENT '用户级别',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_mall_user_account
-- ----------------------------
INSERT INTO `t_mall_user_account` VALUES ('1', 'lilei', 'tom', '123', '测试b2c', '123123123123', '123@11.com', '1', '1');
INSERT INTO `t_mall_user_account` VALUES ('7', 'sdfs1', 'sdfsdf', '123', '123', '123123', '1231', '123', '12223');

-- ----------------------------
-- Table structure for t_mall_user_do_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_do_log`;
CREATE TABLE `t_mall_user_do_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Records of t_mall_user_do_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_info`;
CREATE TABLE `t_mall_user_info` (
  `id_card` int(11) NOT NULL AUTO_INCREMENT COMMENT '身份证编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '用户手机号',
  `yh_jg` varchar(100) DEFAULT NULL COMMENT '用户籍贯',
  `yh_zhzh` varchar(100) DEFAULT NULL COMMENT '用户住址',
  `yh_xb` int(11) DEFAULT NULL COMMENT '0女1男',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of t_mall_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_login_log`;
CREATE TABLE `t_mall_user_login_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户访问日志表';

-- ----------------------------
-- Records of t_mall_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_user_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_pay`;
CREATE TABLE `t_mall_user_pay` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `dd_id` int(11) DEFAULT NULL COMMENT ' 订单id',
  `fkshj` datetime DEFAULT NULL COMMENT '付款时间',
  `dd_je` decimal(10,0) DEFAULT NULL COMMENT '订单金额',
  `zhf_fsh` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `yh` varchar(100) DEFAULT NULL COMMENT '支付银行',
  `yh_lsh` varchar(100) DEFAULT NULL COMMENT '银行流水',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户支付信息表';

-- ----------------------------
-- Records of t_mall_user_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_value
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_value`;
CREATE TABLE `t_mall_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxzh` varchar(100) DEFAULT NULL COMMENT '属性值',
  `shfqy` varchar(1) DEFAULT '1' COMMENT '是否启用',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性id',
  `shxzh_mch` varchar(100) DEFAULT NULL COMMENT '属性值名',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- ----------------------------
-- Records of t_mall_value
-- ----------------------------
INSERT INTO `t_mall_value` VALUES ('30', '1024×768', '1', '13', '像素', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('31', '1600×900', '1', '13', '像素', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('32', '1399×1024', '1', '13', '像素', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('33', '14.5', '1', '14', '寸', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('34', '15.5', '1', '14', '寸', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('35', '24', '1', '14', '寸', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('36', '29', '1', '14', '寸', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('37', '45', '1', '14', '寸', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('38', '曲面', '1', '15', '形', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('39', '非曲面', '1', '15', '形', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('40', '12', '1', '16', '色', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('41', '24', '1', '16', '色', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('42', '48', '1', '16', '色', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('43', '86', '1', '16', '色', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('44', '100', '1', '17', '瓦', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('45', '200', '1', '17', '瓦', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('46', '300', '1', '17', '瓦', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('47', '500', '1', '17', '毫安', '2017-04-12 16:39:25');
INSERT INTO `t_mall_value` VALUES ('48', '三', '1', '18', '翼', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('49', '四', '1', '18', '翼', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('50', '五', '1', '18', '翼', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('51', '四', '1', '19', '驱动', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('52', '八', '1', '19', '驱动', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('53', '1024', '1', '20', '像素', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('54', '2048', '1', '20', '像素', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('55', '4096', '1', '20', '像素', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('56', '轻', '1', '21', '炮', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('57', '中', '1', '21', '炮', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('58', '100', '1', '22', '立方', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('59', '200', '1', '22', '立方', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('60', '300', '1', '22', '立方', '2017-04-12 17:36:49');
INSERT INTO `t_mall_value` VALUES ('61', 'LED', '1', '23', '显示屏', '2017-04-15 09:06:35');
INSERT INTO `t_mall_value` VALUES ('62', 'LCD', '1', '23', '显示屏', '2017-04-15 09:06:35');
INSERT INTO `t_mall_value` VALUES ('63', 'IOS', '1', '23', '显示屏', '2017-04-15 09:06:35');
INSERT INTO `t_mall_value` VALUES ('64', '全景', '1', '24', 'VR', '2017-06-30 15:59:37');
INSERT INTO `t_mall_value` VALUES ('65', '影院', '1', '24', 'VR', '2017-06-30 15:59:37');
INSERT INTO `t_mall_value` VALUES ('66', '1', '1', '25', '厘米', '2017-09-14 10:55:55');
INSERT INTO `t_mall_value` VALUES ('67', '2', '1', '25', '厘米', '2017-09-14 10:55:55');
INSERT INTO `t_mall_value` VALUES ('68', '3', '1', '26', '米', '2017-09-14 10:55:57');
INSERT INTO `t_mall_value` VALUES ('69', '4', '1', '26', '米', '2017-09-14 10:55:57');
INSERT INTO `t_mall_value` VALUES ('70', '1', '1', '29', '厘米', '2017-09-14 10:59:44');
INSERT INTO `t_mall_value` VALUES ('71', '2', '1', '29', '厘米', '2017-09-14 10:59:44');
INSERT INTO `t_mall_value` VALUES ('72', '3', '1', '30', '米', '2017-09-14 10:59:44');
INSERT INTO `t_mall_value` VALUES ('73', '4', '1', '30', '米', '2017-09-14 10:59:44');
INSERT INTO `t_mall_value` VALUES ('74', '1', '1', '31', '厘米', '2017-09-14 11:00:24');
INSERT INTO `t_mall_value` VALUES ('75', '2', '1', '31', '厘米', '2017-09-14 11:00:24');
INSERT INTO `t_mall_value` VALUES ('76', '3', '1', '32', '米', '2017-09-14 11:00:27');
INSERT INTO `t_mall_value` VALUES ('77', '4', '1', '32', '米', '2017-09-14 11:00:27');
INSERT INTO `t_mall_value` VALUES ('78', '1', '1', '33', 'MB', '2017-10-11 12:01:04');
INSERT INTO `t_mall_value` VALUES ('79', '2', '1', '33', 'MB', '2017-10-11 12:01:04');
INSERT INTO `t_mall_value` VALUES ('80', '单', '1', '34', '核心', '2017-10-11 12:01:05');
INSERT INTO `t_mall_value` VALUES ('81', '双', '1', '34', '核心', '2017-10-11 12:01:05');
INSERT INTO `t_mall_value` VALUES ('82', '12', '1', '35', 'MB', '2017-10-11 12:05:44');
INSERT INTO `t_mall_value` VALUES ('83', '213', '1', '35', 'MB', '2017-10-11 12:05:44');
INSERT INTO `t_mall_value` VALUES ('84', '123', '1', '36', '核心', '2017-10-11 12:06:01');
INSERT INTO `t_mall_value` VALUES ('85', '123', '1', '36', '核心', '2017-10-11 12:06:01');
INSERT INTO `t_mall_value` VALUES ('86', '1000', '1', '37', 'dpi', '2017-11-01 17:07:51');
INSERT INTO `t_mall_value` VALUES ('87', '2000', '1', '37', 'dpi', '2017-11-01 17:07:51');
INSERT INTO `t_mall_value` VALUES ('88', '单', '1', '38', '轮', '2017-11-01 17:07:58');
INSERT INTO `t_mall_value` VALUES ('89', '双', '1', '38', '轮', '2017-11-01 17:07:58');
INSERT INTO `t_mall_value` VALUES ('90', '123', '1', '39', '123', '2017-11-22 20:02:06');
INSERT INTO `t_mall_value` VALUES ('91', '123', '1', '39', '123', '2017-11-22 20:02:06');
INSERT INTO `t_mall_value` VALUES ('92', '12', '1', '40', '123', '2017-11-22 20:02:06');
INSERT INTO `t_mall_value` VALUES ('93', '123', '1', '40', '123', '2017-11-22 20:02:06');
INSERT INTO `t_mall_value` VALUES ('94', '123', '1', '41', '123', '2017-11-22 20:05:40');
INSERT INTO `t_mall_value` VALUES ('95', '123', '1', '41', '123', '2017-11-22 20:05:40');
INSERT INTO `t_mall_value` VALUES ('96', '12', '1', '42', '123', '2017-11-22 20:05:40');
INSERT INTO `t_mall_value` VALUES ('97', '123', '1', '42', '123', '2017-11-22 20:05:40');
INSERT INTO `t_mall_value` VALUES ('98', '1', '1', '43', '米', '2017-11-25 16:35:44');
INSERT INTO `t_mall_value` VALUES ('99', '2', '1', '43', '米', '2017-11-25 16:35:44');
INSERT INTO `t_mall_value` VALUES ('100', '100', '1', '44', '斤', '2017-11-25 16:35:44');
INSERT INTO `t_mall_value` VALUES ('101', '200', '1', '44', '斤', '2017-11-25 16:35:44');
INSERT INTO `t_mall_value` VALUES ('102', '1000', '1', '45', '转', '2017-11-28 08:52:04');
INSERT INTO `t_mall_value` VALUES ('103', '2000', '1', '45', '转', '2017-11-28 08:52:04');
INSERT INTO `t_mall_value` VALUES ('104', '3000', '1', '46', '转', '2017-11-28 08:52:04');
INSERT INTO `t_mall_value` VALUES ('105', '4000', '1', '46', '转', '2017-11-28 08:52:04');
INSERT INTO `t_mall_value` VALUES ('106', '1000', '1', '47', '转', '2017-11-28 08:58:02');
INSERT INTO `t_mall_value` VALUES ('107', '2000', '1', '47', '转', '2017-11-28 08:58:02');
INSERT INTO `t_mall_value` VALUES ('108', '3000', '1', '48', '转', '2017-11-28 08:58:03');
INSERT INTO `t_mall_value` VALUES ('109', '4000', '1', '48', '转', '2017-11-28 08:58:03');
INSERT INTO `t_mall_value` VALUES ('110', null, '1', '49', '2', '2017-11-29 11:53:29');
INSERT INTO `t_mall_value` VALUES ('111', null, '1', '49', '2', '2017-11-29 11:53:29');
INSERT INTO `t_mall_value` VALUES ('112', null, '1', '50', '4', '2017-11-29 11:53:29');
INSERT INTO `t_mall_value` VALUES ('113', null, '1', '50', '5', '2017-11-29 11:53:29');
INSERT INTO `t_mall_value` VALUES ('114', null, '1', '0', '1', '2018-01-22 16:04:50');
INSERT INTO `t_mall_value` VALUES ('115', null, '1', '0', '2', '2018-01-22 16:04:50');
INSERT INTO `t_mall_value` VALUES ('116', null, '1', '0', '4', '2018-01-22 16:04:51');
INSERT INTO `t_mall_value` VALUES ('117', null, '1', '0', '6', '2018-01-22 16:04:51');
