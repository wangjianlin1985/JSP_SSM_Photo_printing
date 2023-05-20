/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : photo_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-05-02 21:48:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我要来拍照冲印', '可以发照片文件给你们冲洗吗', 'user1', '2019-04-30 16:08:39', '可以的呢', '2019-04-30 16:08:43');
INSERT INTO `t_leaveword` VALUES ('2', '冲洗越多，优惠多吗？', '最低可以打几折哦！', 'user1', '2019-05-02 21:42:45', '--', '--');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '网上照片冲印店成立', '<p>你发给我照片，我就能给你发货冲洗好的照片，还送相册相框，爽吧？</p><p>www.36588.com.cn</p>', '2019-04-30 16:08:54');
INSERT INTO `t_notice` VALUES ('2', '冲洗多多，优惠多多', '<p>冲洗越多的客户，可以享受更多的优惠哦！</p>', '2019-05-02 21:09:01');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `productName` int(11) NOT NULL COMMENT '订单商品',
  `orderNumber` int(11) NOT NULL COMMENT '订单数量',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `printFile` varchar(60) NOT NULL COMMENT '待冲印照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `orderStateObj` int(11) NOT NULL COMMENT '订单状态',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  `handleFile` varchar(60) NOT NULL COMMENT '下载地址',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  PRIMARY KEY  (`orderId`),
  KEY `productName` (`productName`),
  KEY `orderStateObj` (`orderStateObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_3` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`productName`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_orderinfo_ibfk_2` FOREIGN KEY (`orderStateObj`) REFERENCES `t_orderstate` (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('1', '1', '2', '12.5', 'upload/ad94d3b1-a219-4d56-8c4d-a59f06387945.zip', '13598308394', '5', '快点ps打印给我', 'upload/edf19bf7-a0e6-4022-ac6d-213d0c3f3fa5.zip', 'user1', '2019-03-31 14:02:36');
INSERT INTO `t_orderinfo` VALUES ('2', '2', '2', '5', 'upload/caf70344-2116-4989-946a-df4f95d9b85b.zip', '13598039934', '3', '我和媳妇的结婚证洗2份\r\n\r\n员工回复：洗好了你自己来拿吧', 'upload/7555c5f8-6a71-4b0f-9e69-cdc202f3a2e0.zip', 'user1', '2019-04-30 14:02:36');

-- ----------------------------
-- Table structure for `t_orderstate`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderstate`;
CREATE TABLE `t_orderstate` (
  `stateId` int(11) NOT NULL auto_increment COMMENT '状态id',
  `stateName` varchar(20) NOT NULL COMMENT '状态名称',
  PRIMARY KEY  (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderstate
-- ----------------------------
INSERT INTO `t_orderstate` VALUES ('1', '待付款');
INSERT INTO `t_orderstate` VALUES ('2', '已付款');
INSERT INTO `t_orderstate` VALUES ('3', '客户自取');
INSERT INTO `t_orderstate` VALUES ('4', '已发货');
INSERT INTO `t_orderstate` VALUES ('5', '交易完成');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '套餐类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品主图',
  `price` float NOT NULL COMMENT '商品价格',
  `productDesc` varchar(8000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '5寸照片冲洗', 'upload/87d639ac-837a-4d2b-96cb-9fac67d43ba0.jpg', '0.55', '<p><br/>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！<br/></p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p>留住你的青春，记录年轻的时光，冲洗照片送相册哦！</p><p><br/></p><table width=\"100%\"><tbody><tr class=\"g3 f14 firstRow\" style=\"font-size: 14px; height: 40px; cursor: pointer;\"><td class=\"paperType tc vm\" width=\"125\" style=\"vertical-align: middle; position: relative; line-height: 30px;\"><span class=\"vm\" style=\"vertical-align: middle;\">金冠光面相纸</span>&nbsp;<span class=\"tipIcon\" style=\"display: inline-block; width: 15px; height: 15px; background: url(&quot;http://www.36588.com.cn/active/active/ftp/printNew/icon.png&quot;) left top no-repeat; vertical-align: middle;\"></span></td><td class=\"paperType tc vm\" width=\"125\" style=\"vertical-align: middle; position: relative; line-height: 30px;\"><span class=\"vm\" style=\"vertical-align: middle;\">晶彩光面相纸</span>&nbsp;<span class=\"tipIcon\" style=\"display: inline-block; width: 15px; height: 15px; background: url(&quot;http://www.36588.com.cn/active/active/ftp/printNew/icon.png&quot;) left top no-repeat; vertical-align: middle;\"></span></td><td class=\"paperType tc vm\" width=\"125\" style=\"vertical-align: middle; position: relative; line-height: 30px;\"><span class=\"vm\" style=\"vertical-align: middle;\">乐凯人像绒面</span>&nbsp;<span class=\"tipIcon\" style=\"display: inline-block; width: 15px; height: 15px; background: url(&quot;http://www.36588.com.cn/active/active/ftp/printNew/icon.png&quot;) left top no-repeat; vertical-align: middle;\"></span></td><td class=\"paperType tc vm\" width=\"125\" style=\"vertical-align: middle; position: relative; line-height: 30px;\"><span class=\"vm\" style=\"vertical-align: middle;\">皇家绒面相纸</span>&nbsp;<span class=\"tipIcon\" style=\"display: inline-block; width: 15px; height: 15px; background: url(&quot;http://www.36588.com.cn/active/active/ftp/printNew/icon.png&quot;) left top no-repeat; vertical-align: middle;\"></span></td><td class=\"paperType tc vm\" width=\"125\" style=\"vertical-align: middle; position: relative; line-height: 30px;\"><br/></td></tr><tr class=\"te tc f16\" style=\"font-size: 16px; height: 40px; cursor: pointer; background: none;\"><td class=\"tr\" style=\"text-align: right;\">5寸(3R)</td><td>0.55元</td><td>0.42元</td><td>0.41元</td><td>0.49元</td></tr></tbody></table><p><br/></p>', '2019-04-30 16:05:40');
INSERT INTO `t_product` VALUES ('2', '2', '1 寸证件照', 'upload/a6701dd3-2b4b-452f-a6b8-98d992ba5b7d.jpg', '2.5', '<p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p>各种证件照片，包括身份证，驾驶证，结婚证等都可以冲洗！</p><p><br/></p>', '2019-05-02 15:29:23');
INSERT INTO `t_product` VALUES ('3', '1', '10寸大尺寸冲印', 'upload/78e964d0-5f4f-432b-aba9-565fd277e2fc.jpg', '3.5', '<p>将团聚的日子记录下来</p><p>无论全家福、结婚照，还是各种聚会，大尺寸照片是记录团聚好的方式</p><p><br/></p><p>大而清晰 色彩细腻</p><p>曾经的温馨经不起问候，色彩淡淡退去一张曾让世人羡慕的全家福，在诉说昔日的温馨--那就是子女想要的归宿。</p><p><br/></p><p>青春无限 我们永远在一起~</p><p>让一切美好在瞬间定格</p><p>抓住生活中的美 留住每一份感动</p><p><br/></p><p><img src=\"http://localhost:8080/JavaWebProject/upload/20190502/1556803138219051419.jpg\" title=\"1556803138219051419.jpg\" alt=\"2.jpg\" width=\"579\" height=\"380\"/></p><p><br/></p><p><br/></p>', '2019-05-02 21:19:13');
INSERT INTO `t_product` VALUES ('4', '5', '5寸 进口实木多色相框', 'upload/bd9b0289-a637-4077-8878-f4973cab5c8c.jpg', '8.8', '<p>5寸 进口实木多色相框</p><p>5寸 进口实木多色相框</p><p>5寸 进口实木多色相框</p>', '2019-05-02 21:23:16');
INSERT INTO `t_product` VALUES ('5', '5', '欧式复古相框', 'upload/9af8f972-9129-4ef7-afa5-2fb07ae43c00.jpg', '14.8', '<p><img src=\"/JavaWebProject/upload/20190502/1556803566866000437.gif\" title=\"1556803566866000437.gif\" alt=\"a.gif\"/><br/><img src=\"/JavaWebProject/upload/20190502/1556803572809013414.gif\" title=\"1556803572809013414.gif\" alt=\"b.gif\"/></p>', '2019-05-02 21:25:02');
INSERT INTO `t_product` VALUES ('6', '2', '2寸证件照', 'upload/d9bf3483-68b3-4bd6-8127-2efa6e3e2980.jpg', '4.5', '<p>白色背景：用于护照、签证、驾驶证<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[4]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;、身份证、二代身份证、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A9%BE%E9%A9%B6%E8%AF%81\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">驾驶证</a>、黑白证件、医保卡、港澳通行证等</p><p>蓝色背景：用于毕业证、工作证、简历等(蓝色数值为:R:0 G:191 B:243 或C:67 M:2 Y:0 K:0)</p><p>红色背景：用于保险、医保、IC卡、暂住证、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%93%E5%A9%9A%E7%85%A7\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">结婚照</a>&nbsp;(红色数值为:R:255 G:0 B:0 或C:0 M:99 Y:100 K:0)</p><p><br/></p>', '2019-05-02 21:32:45');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '套餐分类',
  `classDesc` varchar(500) NOT NULL COMMENT '套餐描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '普通冲印', '普通冲印');
INSERT INTO `t_productclass` VALUES ('2', '证件照', '证件照');
INSERT INTO `t_productclass` VALUES ('3', '拍立得冲印', '拍立得冲印');
INSERT INTO `t_productclass` VALUES ('4', '大尺寸印刷照片', '大尺寸印刷照片');
INSERT INTO `t_productclass` VALUES ('5', '时尚相框', '时尚相框');
INSERT INTO `t_productclass` VALUES ('6', 'DIY相册及配件', 'DIY相册及配件');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '王晓婷', '女', '2019-04-10', 'upload/71088187-5cf4-4813-9038-13d580319844.jpg', '13958342342', 'xiaofen@163.com', '四川成都红星路13号', '2019-04-30 16:03:38');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '张喜芬', '女', '2019-05-01', 'upload/a981693c-5260-4d2c-800f-a39cb3994cdc.jpg', '13573598343', 'xifen@163.com', '四川南充滨江路', '2019-05-02 13:08:16');
