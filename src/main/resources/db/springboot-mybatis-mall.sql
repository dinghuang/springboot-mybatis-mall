/*
Navicat MySQL Data Transfer

Source Server         : IDEA
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : springboot-mybatis-mall

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-04 09:52:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bigmc
-- ----------------------------
DROP TABLE IF EXISTS `bigmc`;
CREATE TABLE `bigmc` (
  `bid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '大类编号',
  `bname` varchar(30) NOT NULL COMMENT '大类名称',
  PRIMARY KEY (`bid`),
  KEY `BNAME` (`bname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='商品大类';

-- ----------------------------
-- Records of bigmc
-- ----------------------------
INSERT INTO `bigmc` VALUES ('8', '冰箱');
INSERT INTO `bigmc` VALUES ('2', '平板电脑');
INSERT INTO `bigmc` VALUES ('1', '手机');
INSERT INTO `bigmc` VALUES ('4', '电视');
INSERT INTO `bigmc` VALUES ('6', '移动电源');
INSERT INTO `bigmc` VALUES ('7', '空调');
INSERT INTO `bigmc` VALUES ('3', '笔记本');
INSERT INTO `bigmc` VALUES ('5', '耳机');
INSERT INTO `bigmc` VALUES ('10', '键盘');
INSERT INTO `bigmc` VALUES ('9', '鼠标');

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `did` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '打折编号',
  `mid` bigint(8) DEFAULT NULL COMMENT '商品编号',
  `sid` bigint(8) DEFAULT NULL COMMENT '小类编号',
  `bid` bigint(8) DEFAULT NULL COMMENT '大类编号',
  `dstartdate` datetime DEFAULT NULL COMMENT '开始时间',
  `denddate` datetime DEFAULT NULL COMMENT '结束时间',
  `ddiscount` bigint(8) DEFAULT NULL COMMENT '折扣度',
  PRIMARY KEY (`did`),
  KEY `FK_DISCOUNT_REFERENCE_BIGMC` (`bid`),
  KEY `FK_DISCOUNT_REFERENCE_MC` (`mid`),
  KEY `FK_DISCOUNT_REFERENCE_SMALLMC` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='折扣';

-- ----------------------------
-- Records of discount
-- ----------------------------

-- ----------------------------
-- Table structure for mc
-- ----------------------------
DROP TABLE IF EXISTS `mc`;
CREATE TABLE `mc` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `mname` varchar(30) NOT NULL COMMENT '商品名称',
  `mdescription` varchar(300) DEFAULT NULL COMMENT '商品描述',
  `mprice` bigint(20) NOT NULL COMMENT '商品价格',
  `mimg` varchar(2000) DEFAULT NULL COMMENT '商品图片',
  `mtotal` bigint(20) NOT NULL COMMENT '商品总数量',
  `mstock` varchar(2) NOT NULL COMMENT '是否缺贷',
  `mdate` datetime NOT NULL COMMENT '添加时间',
  `sid` bigint(20) NOT NULL COMMENT '所属小类',
  PRIMARY KEY (`mid`),
  KEY `MNAME` (`mname`),
  KEY `FK_MC_REFERENCE_SMALLMC` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='商品信息表';

-- ----------------------------
-- Records of mc
-- ----------------------------
INSERT INTO `mc` VALUES ('1', 'iPhone5', '超强音质', '1999', '11d7701b-4876-46d1-8101-c1c65fc37af5.jpg', '200', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `mc` VALUES ('2', 'iPhone5s', '先进的 iPhone 5s，满载出色功能和创新技术，现更值得拥有。', '3588', '2b729eb5-3501-4993-97e3-a0ed465861e7.jpg', '200', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `mc` VALUES ('3', 'iPhone6', 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机', '4988', '6a42212b-9696-4067-9483-60945ccb2a5f.jpg', '200', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `mc` VALUES ('4', 'iPhone6Plus', 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机', '5788', 'b41729f3-5d4e-4b79-81e4-394bc141b41d.jpg', '200', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `mc` VALUES ('5', 'Galaxy Note3', '5.5英寸高清大屏，1.6GHz四核处理器，16GB ROM+2GB RAM！', '1698', 'addbbe26-4029-411e-ae5b-381730216361.jpg', '200', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `mc` VALUES ('6', 'Galaxy S5', 'Galaxy S5，万众瞩目，倍受期待！', '2488', '9e9c1bc1-8848-461e-b273-5c5d989034de.jpg', '200', '0', '2018-01-02 00:00:00', '2');
INSERT INTO `mc` VALUES ('7', 'Galaxy S6', '赠原装OTG+原装后壳！金属边框&玻璃机身！', '4488', '03c47f16-4105-4572-b317-27666680b06e.jpg', '200', '0', '2018-01-02 00:00:00', '2');
INSERT INTO `mc` VALUES ('8', '荣耀6', '荣耀经典款，开放购买不限购！5英寸舒适手感，32G大存储！没溜(6)不行，超3.7万好评~', '1799', '185e39c5-537c-4a43-8e99-e629c0d3e2d6.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('9', '荣耀7', '华为 荣耀7 4G双卡双待双通手机 冰河银 移动4G(16G ROM) 标配', '2299', '54b86d12-6c27-4a54-b9cc-326b3ade7f10.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('10', 'P8', '购买套装（原装皮套+贴膜+快充+16G卡）更实惠！2015年华为重磅旗舰机型！', '2988', '942c0061-7e0f-4b92-a777-595a1744128a.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('11', 'Mate7', '6英寸高清大屏，全金属纤薄机身，智能超八核，按压式指纹识别！', '2999', '47f45dcb-fe7f-48cb-8399-c3e7fbfa499d.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('12', '荣耀4A', '下次抢购预告：8月25日10:08！荣耀优等生，青春不停歇！', '599', '628e9a29-d126-4c49-b3a1-6384962e71e1.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('13', '麦芒4', '货源紧俏，手慢无货，速抢！', '2099', 'a30ef5f1-ee21-4420-9248-80067361dd9b.jpg', '200', '0', '2018-01-02 00:00:00', '3');
INSERT INTO `mc` VALUES ('14', 'SONY  Z3', '经典工艺设计，2070万像素索尼G镜头，5.2英寸高清屏，高通骁龙2.5GHz四核处理器！', '3599', 'bd0688d2-6c23-45e4-b54e-49f7fec14010.jpg', '200', '0', '2018-01-02 00:00:00', '4');
INSERT INTO `mc` VALUES ('15', '小米Note', '大屏旗舰，HIFI 双卡双待，强大性能集于一身！', '1999', '21255518-d272-4ba7-a030-919b2891c56d.jpg', '200', '0', '2018-01-02 00:00:00', '5');
INSERT INTO `mc` VALUES ('16', '魅族MX4', '好评过3万！仅售1499元，现货速抢，手慢后悔！', '1499', '78a3d49b-2fee-4b0e-8d86-735d9628002c.jpg', '200', '0', '2018-01-02 00:00:00', '6');
INSERT INTO `mc` VALUES ('17', '魅族MX5', '【超值套装版】魅族 MX5 16GB 银黑色 移动4G手机 双卡双待', '1999', '78929523-1b21-4426-99c9-d087994f1679.jpg', '200', '0', '2018-01-02 00:00:00', '6');
INSERT INTO `mc` VALUES ('18', 'iPad Air', '将出众的性能和绚丽夺目的 Retina 显示屏、纳于纤薄、耐用的铝金属机身之中', '2788', '62ae572d-b20e-41fd-9d5b-27f1daf9df63.jpg', '200', '0', '2018-01-02 00:00:00', '7');
INSERT INTO `mc` VALUES ('19', '华为M2', '【影音王者】金属机身，哈曼卡顿专业音质；8核超强芯，3G大内存；护眼模式、分屏模式，为舒适而生！', '1488', '21d15b1c-df96-412a-8d65-a27c1653f8f8.jpg', '200', '0', '2018-01-02 00:00:00', '8');
INSERT INTO `mc` VALUES ('20', '小米平板', '3万好评，明智之选！APP下单更优惠！【小米品质】多彩后壳，好看生活，白色浪漫纯真！', '1299', '0361b789-a37c-4ece-aa1e-858bd8626feb.jpg', '200', '0', '2018-01-02 00:00:00', '9');
INSERT INTO `mc` VALUES ('21', 'MacBook Air', '纤薄、轻巧却又十分耐用，极为适合随身携带。而它的强劲性能，又能让你轻松应对各项事务。', '6528', 'cb976d22-8ffe-41fd-93f6-69dec568c408.jpg', '200', '0', '2018-01-02 00:00:00', '10');
INSERT INTO `mc` VALUES ('22', 'MacBook Pro', '无论你有何创想，配备 Retina 显示屏的 MacBook Pro 所具备的非凡性能，将会帮助你去尽情实现', '9288', '9c25fb67-10fa-489c-89f1-abec51cc0468.jpg', '200', '0', '2018-01-02 00:00:00', '10');
INSERT INTO `mc` VALUES ('23', '联想 G50-70M', '【大屏独显爆款】全新升级金属C面 Nvida 2G独显配大屏 耍游戏看电影什么的最爽了！限量抢购，抢完即止', '3599', 'c15caa29-598d-4dcd-886a-35683140ee53.jpg', '200', '0', '2018-01-02 00:00:00', '11');
INSERT INTO `mc` VALUES ('24', '灵越 飞匣3000系列', '【手机购买更优惠！五代i5独显性价比机皇】 有钱有势不如有速度有激情！', '2999', 'c201a95e-9c6b-4e13-816e-c90df69821e9.jpg', '200', '0', '2018-01-02 00:00:00', '12');
INSERT INTO `mc` VALUES ('25', 'ASUS经典系列R557LI', '华硕笔记本i5经典机型，学生本，高性价比，办公 娱乐无压力！', '3499', '1a992f72-5cb9-456a-96c4-268ab75631de.jpg', '200', '0', '2018-01-02 00:00:00', '13');
INSERT INTO `mc` VALUES ('26', '海信 LED55EC520UA ', '新品尝鲜在这里，海信电视高端智能4K首发，8月31日前下单还送490元VIP视频年卡~快来抢购吧~', '4599', 'a3d57a10-f2ce-4d96-88c0-89591539b1c5.jpg', '200', '0', '2018-01-02 00:00:00', '14');
INSERT INTO `mc` VALUES ('27', '夏普 LCD-55DS72A', '明星单品！8.7日-8.31日期间下单，9.15日前好评者返50元话费京券（9.30日前返还），还不赶快行动！', '5599', 'fa07f214-c4d8-4fea-9644-ac71ef85e77e.jpg', '200', '0', '2018-01-02 00:00:00', '15');
INSERT INTO `mc` VALUES ('28', '漫步者（EDIFIER） H180P', '手机经典神器，内置高清麦克风，通话音质双保证！', '49', '16966658-bd55-4e98-8b90-9cc08685d9a8.jpg', '200', '0', '2018-01-02 00:00:00', '16');
INSERT INTO `mc` VALUES ('29', '铁三角 ATH-CLR100', 'ces明星产品 我是小清新 轻柔入耳，如指尖轻触你的耳廓，耳机收纳器，硅胶套，均衡的音质，满足，不只是一瞬间', '119', '1c882baf-7619-4b3d-970a-466c272da24d.jpg', '200', '0', '2018-01-02 00:00:00', '17');
INSERT INTO `mc` VALUES ('30', '罗马式10400毫安移动电源', '情侣款大容量移动电源，带上它们，让我们来一场旅行结婚吧！支持货到付款！', '89', '2d339e1d-3b6b-4ee5-ae27-be6e4b70668a.jpg', '200', '0', '2018-01-02 00:00:00', '18');
INSERT INTO `mc` VALUES ('31', '品胜 10000毫安 移动电源', '有插头更方便 双充电模式 自带插头 1A/2A智能输出 四灯电量显示', '89', 'b7307abf-60e4-4ce0-931b-0b2dcffc5cea.jpg', '200', '0', '2018-01-02 00:00:00', '19');
INSERT INTO `mc` VALUES ('32', '格力（GREE）KFR-26GW', 'Q铂系列！性价比超高机型！畅销变频爆款！1赫兹变频！运行只需45瓦！好空调，只选格力！', '2899', 'd18a8b8a-01d8-414a-a8d1-7490eb900cd7.jpg', '200', '0', '2018-01-02 00:00:00', '20');
INSERT INTO `mc` VALUES ('33', '美的  KFR-35GW', '爆品狂抢！强劲运行！京东英雄，高配稀土压缩机！品质机芯，强劲制冷！点击下方套装，享受加1元得精美空调罩！', '3099', '3fd1866b-db2a-46e3-8a1b-1c240e787810.jpg', '200', '0', '2018-01-02 00:00:00', '21');
INSERT INTO `mc` VALUES ('34', '奥克斯 KFR-25GW', '【性价比之王，全新问世！】1匹冷暖空调！性价比之王，荣耀加冕！纯铜链接管，舒爽快人一步！', '1649', '96c5082c-0c6f-4f15-9760-3fc1d14b7ecf.jpg', '200', '0', '2018-01-02 00:00:00', '22');
INSERT INTO `mc` VALUES ('35', '海尔 BCD-206S', '超值1399！海尔畅销206升三门冰箱 007软冻 锁住营养不流失 宽电压设计 超高性价比 ！', '1399', 'a09b65b2-6b19-4dd0-b740-8f8a1369cf7e.jpg', '200', '0', '2018-01-02 00:00:00', '23');
INSERT INTO `mc` VALUES ('36', '美的 BCD-206TM(E)', '人气推荐！美的畅销三门冰箱！独立三温区，领“鲜”技术，急速制冷，确保食物新鲜！', '1398', '33b68e16-4608-4097-a697-985d5d545fc7.jpg', '200', '0', '2018-01-02 00:00:00', '24');
INSERT INTO `mc` VALUES ('37', '罗技  M185 无线鼠标 ', '好评40万，唯美外形，经典办公鼠标！', '69', 'e95ba7bc-64d6-4f97-be83-cedcc2c1c7ed.jpg', '200', '0', '2018-01-02 00:00:00', '25');
INSERT INTO `mc` VALUES ('38', '雷蛇（Razer）炼狱蝰蛇 ', '心动？加入购物车，才是真的心动，我是蝰蛇！玩家的最爱！', '259', 'e348fe82-1a01-480d-9453-3d967fce0d50.jpg', '200', '0', '2018-01-02 00:00:00', '26');
INSERT INTO `mc` VALUES ('39', '海盗船  K70', '原汁原味 真材实料 德国原厂CHERRY革命性RGB红轴 海盗船精品做工 !LOL,dota2游戏神器!', '1399', 'c27b579e-f089-4a7b-91c1-2c35cb577446.jpg', '200', '0', '2018-01-02 00:00:00', '27');
INSERT INTO `mc` VALUES ('40', '赛睿  6Gv2', '原厂黑轴,黄金触点的机械轴不仅能带来与众不同的触觉反馈,还保证5000万次的敲击寿命!', '699', '3d9412f2-0679-4b9b-9888-cf95129cb17b.jpg', '200', '0', '2018-01-02 00:00:00', '28');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `oiid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `oid` bigint(20) NOT NULL COMMENT '所属订单',
  `mid` bigint(20) NOT NULL COMMENT '订购商品ID',
  `oicount` bigint(20) NOT NULL COMMENT '商品数',
  `oitotalprice` bigint(20) NOT NULL COMMENT '小计',
  PRIMARY KEY (`oiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单明细表';

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for rolling
-- ----------------------------
DROP TABLE IF EXISTS `rolling`;
CREATE TABLE `rolling` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mid` bigint(20) NOT NULL COMMENT '商品编号',
  `rimg` varchar(2000) NOT NULL COMMENT '滚动图片',
  PRIMARY KEY (`rid`),
  KEY `FK_ROLLING` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='ROLLING';

-- ----------------------------
-- Records of rolling
-- ----------------------------
INSERT INTO `rolling` VALUES ('1', '9', '6de5bb4b-1a88-4d1a-8ba2-1cf179aea364.jpg');
INSERT INTO `rolling` VALUES ('2', '13', '60637e14-09de-473d-95fb-aab15d401a12.jpg');
INSERT INTO `rolling` VALUES ('3', '10', 'e4b91e86-f182-402e-a09c-fa0ff4e18ff5.jpg');
INSERT INTO `rolling` VALUES ('4', '12', '3e6abc49-b637-4376-a7c5-7943ee7644a4.jpg');
INSERT INTO `rolling` VALUES ('5', '11', '38441cf4-eb93-40f8-94ea-ea423e8f64d8.jpg');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `scid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `tuser` varchar(30) NOT NULL COMMENT '用户名',
  `mid` bigint(20) NOT NULL COMMENT '商品ID',
  `sccount` bigint(8) NOT NULL COMMENT '商品数',
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车';

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for smallmc
-- ----------------------------
DROP TABLE IF EXISTS `smallmc`;
CREATE TABLE `smallmc` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '小类编号',
  `sname` varchar(30) NOT NULL COMMENT '小类名称',
  `bid` bigint(20) NOT NULL COMMENT '所属大类ID',
  PRIMARY KEY (`sid`),
  KEY `SNAME` (`sname`),
  KEY `FK_SMALLMC_REFERENCE_BIGMC` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='商品小类';

-- ----------------------------
-- Records of smallmc
-- ----------------------------
INSERT INTO `smallmc` VALUES ('1', 'iPhone', '1');
INSERT INTO `smallmc` VALUES ('2', '三星', '1');
INSERT INTO `smallmc` VALUES ('3', '华为手机', '1');
INSERT INTO `smallmc` VALUES ('4', 'SONY', '1');
INSERT INTO `smallmc` VALUES ('5', '小米手机', '1');
INSERT INTO `smallmc` VALUES ('6', '魅族', '1');
INSERT INTO `smallmc` VALUES ('7', 'iPad', '2');
INSERT INTO `smallmc` VALUES ('8', '华为平板', '2');
INSERT INTO `smallmc` VALUES ('9', '小米平板', '2');
INSERT INTO `smallmc` VALUES ('10', 'macbook', '3');
INSERT INTO `smallmc` VALUES ('11', '联想', '3');
INSERT INTO `smallmc` VALUES ('12', '戴尔', '3');
INSERT INTO `smallmc` VALUES ('13', '华硕', '3');
INSERT INTO `smallmc` VALUES ('14', '海信', '4');
INSERT INTO `smallmc` VALUES ('15', '夏普', '4');
INSERT INTO `smallmc` VALUES ('16', '漫步者', '5');
INSERT INTO `smallmc` VALUES ('17', '铁三角', '5');
INSERT INTO `smallmc` VALUES ('18', '罗马仕', '6');
INSERT INTO `smallmc` VALUES ('19', '品胜', '6');
INSERT INTO `smallmc` VALUES ('20', '格力空调', '7');
INSERT INTO `smallmc` VALUES ('21', '美的空调', '7');
INSERT INTO `smallmc` VALUES ('22', '奥克斯', '7');
INSERT INTO `smallmc` VALUES ('23', '海尔', '8');
INSERT INTO `smallmc` VALUES ('24', '美的冰箱', '8');
INSERT INTO `smallmc` VALUES ('25', '罗技', '9');
INSERT INTO `smallmc` VALUES ('26', '雷蛇', '9');
INSERT INTO `smallmc` VALUES ('27', '海盗船', '10');
INSERT INTO `smallmc` VALUES ('28', '赛睿', '10');

-- ----------------------------
-- Table structure for torder
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `tuser` varchar(30) NOT NULL COMMENT '订单用户名',
  `oorderdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `opaymethod` varchar(30) NOT NULL COMMENT '付款方式',
  `osendmethod` varchar(30) NOT NULL COMMENT '发贷方式',
  `omctypesize` bigint(20) NOT NULL COMMENT '商品种类数',
  `omcsize` bigint(20) NOT NULL COMMENT '商品总个数',
  `ototalprice` bigint(20) NOT NULL COMMENT '订单总金额',
  `ostatus` varchar(1) NOT NULL COMMENT '审核状态',
  `omsg` varchar(2000) DEFAULT NULL COMMENT '订单反馈',
  `oeuser` varchar(30) DEFAULT NULL COMMENT '审核人',
  `oedate` datetime DEFAULT NULL COMMENT '审核时间',
  `oname` varchar(30) NOT NULL COMMENT '收贷人',
  `oaddress` varchar(300) NOT NULL COMMENT '收贷人地址',
  `ocode` varchar(6) NOT NULL COMMENT '收贷人邮编',
  `ophone` varchar(30) NOT NULL COMMENT '收贷人联系电话',
  `oemail` varchar(300) NOT NULL COMMENT '收贷人email',
  PRIMARY KEY (`oid`),
  KEY `FK_TORDER_REFERENCE_TUSER` (`tuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of torder
-- ----------------------------

-- ----------------------------
-- Table structure for tuser
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `tuser` varchar(30) NOT NULL COMMENT '用户名',
  `tpwd` varchar(30) NOT NULL COMMENT '密码',
  `taccount` bigint(20) NOT NULL COMMENT '账户余额',
  `tname` varchar(30) NOT NULL COMMENT '真实姓名',
  `tsex` varchar(3) NOT NULL COMMENT '性别',
  `tbirth` datetime NOT NULL COMMENT '出生日期',
  `temail` varchar(300) NOT NULL COMMENT '电子邮箱',
  `tphone` varchar(30) NOT NULL COMMENT '电话号码',
  `taddress` varchar(300) NOT NULL COMMENT '地址',
  `tcode` varchar(6) NOT NULL COMMENT '邮编',
  `tregdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `tlock` varchar(1) NOT NULL COMMENT '是否冻结',
  `tlastdate` datetime NOT NULL COMMENT '最后登录时间',
  `tlogin` bigint(20) NOT NULL COMMENT '登录次数',
  `trights` varchar(1) NOT NULL COMMENT '用户权限',
  PRIMARY KEY (`tuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('admin', '888888', '0', 'admin', '男', '1995-03-30 00:00:00', 'admin@163.com', '000000', '福州', '000000', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '0');
INSERT INTO `tuser` VALUES ('dinghuang', '123456', '0', 'dinghuang', '男', '1995-03-30 00:00:00', 'user2@163.com', '555555', '上海', '555555', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
INSERT INTO `tuser` VALUES ('sys1', '888888', '0', 'sys1', '女', '1995-03-30 00:00:00', 'sys1@163.com', '111111', '福州', '111111', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '1');
INSERT INTO `tuser` VALUES ('sys2', '888888', '0', 'sys2', '男', '1995-03-30 00:00:00', 'sys2@163.com', '222222', '泉州', '222222', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '1');
INSERT INTO `tuser` VALUES ('sys3', '888888', '0', 'sys3', '男', '1995-03-30 00:00:00', 'sys3@163.com', '333333', '南昌', '333333', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '1');
INSERT INTO `tuser` VALUES ('user1', '888888', '0', 'user1', '男', '1995-03-30 00:00:00', 'user1@163.com', '444444', '北京', '444444', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
INSERT INTO `tuser` VALUES ('user3', '888888', '0', 'user3', '男', '1995-03-30 00:00:00', 'user3@163.com', '666666', '厦门', '666666', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
INSERT INTO `tuser` VALUES ('user4', '888888', '0', 'user4', '女', '1995-03-30 00:00:00', 'user4@163.com', '777777', '杭州', '777777', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
INSERT INTO `tuser` VALUES ('user5', '888888', '0', 'user5', '男', '1995-03-30 00:00:00', 'user5@163.com', '888888', '南昌', '888888', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
INSERT INTO `tuser` VALUES ('user6', '888888', '0', 'user6', '女', '1995-03-30 00:00:00', 'user6@163.com', '999999', '福州', '999999', '2018-01-02 00:00:00', '0', '2018-01-02 00:00:00', '1', '2');
