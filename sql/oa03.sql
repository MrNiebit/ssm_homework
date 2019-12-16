/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : 127.0.0.1:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-12-16 12:37:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `depname` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for flow_manage
-- ----------------------------
DROP TABLE IF EXISTS `flow_manage`;
CREATE TABLE `flow_manage` (
  `ID` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `flow_name` varchar(20) DEFAULT NULL,
  `flow_uid1` int(11) DEFAULT NULL,
  `assess1` char(1) DEFAULT NULL,
  `assess_time1` date DEFAULT NULL,
  `assess_view1` varchar(50) DEFAULT NULL,
  `flow_uid2` int(11) DEFAULT NULL,
  `assess2` char(1) DEFAULT NULL,
  `assess_view2` varchar(50) DEFAULT NULL,
  `assess_time2` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_manage
-- ----------------------------

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `ID` int(11) NOT NULL,
  `depid` int(11) DEFAULT NULL,
  `m_type` int(11) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `all_uid` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `upload` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room`;
CREATE TABLE `meeting_room` (
  `ID` int(11) NOT NULL,
  `room_name` varchar(20) DEFAULT NULL,
  `room_content` varchar(100) DEFAULT NULL,
  `room_pic` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_room
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_type
-- ----------------------------
DROP TABLE IF EXISTS `meeting_type`;
CREATE TABLE `meeting_type` (
  `ID` int(11) NOT NULL,
  `fid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_type
-- ----------------------------

-- ----------------------------
-- Table structure for mess_group
-- ----------------------------
DROP TABLE IF EXISTS `mess_group`;
CREATE TABLE `mess_group` (
  `ID` int(11) NOT NULL,
  `g_name` varchar(20) DEFAULT NULL,
  `g_content` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mess_group
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL,
  `g_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `MSN` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for newlabel
-- ----------------------------
DROP TABLE IF EXISTS `newlabel`;
CREATE TABLE `newlabel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) DEFAULT NULL,
  `label_content` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newlabel
-- ----------------------------
INSERT INTO `newlabel` VALUES ('1', '体育新闻', '体育新闻  体育新闻', null);
INSERT INTO `newlabel` VALUES ('2', '娱乐新闻', '娱乐新闻娱乐新闻娱乐新闻', null);
INSERT INTO `newlabel` VALUES ('3', '时政新闻', '时政新闻时政新闻时政新闻', null);
INSERT INTO `newlabel` VALUES ('4', '国际足球', '国际足球国际足球', '1');
INSERT INTO `newlabel` VALUES ('5', 'CBA', '中国篮球中国篮球', '1');
INSERT INTO `newlabel` VALUES ('6', '武林风', '河南武林风', '1');
INSERT INTO `newlabel` VALUES ('7', '网球', '网球网球', '1');
INSERT INTO `newlabel` VALUES ('8', '羽毛球', '羽毛球羽毛球', '1');
INSERT INTO `newlabel` VALUES ('9', '乒乓球', '乒乓球乒乓球', '1');
INSERT INTO `newlabel` VALUES ('10', '中超联赛', '中超联赛中超联赛', '1');
INSERT INTO `newlabel` VALUES ('11', '体坛名将', '体坛名将体坛名将', '1');
INSERT INTO `newlabel` VALUES ('12', '体坛快讯', '体坛快讯体坛快讯', '1');
INSERT INTO `newlabel` VALUES ('13', '快乐影院', '看电影看电影', '2');
INSERT INTO `newlabel` VALUES ('14', '早间新闻', '新闻....新闻....新闻......新闻....', '3');
INSERT INTO `newlabel` VALUES ('30', '测试------------', '将该测试修改为父栏目', null);
INSERT INTO `newlabel` VALUES ('33', '测试------------', null, '2');
INSERT INTO `newlabel` VALUES ('34', '测试------------', null, '2');
INSERT INTO `newlabel` VALUES ('35', '测试------------', null, '2');
INSERT INTO `newlabel` VALUES ('36', '测试------------', '啦啦啦啦啦啦啦啦啦', '30');
INSERT INTO `newlabel` VALUES ('37', '测试------------', '修改为时政新闻..................', '3');
INSERT INTO `newlabel` VALUES ('38', '测试------------', '修改为体育新闻............', '1');
INSERT INTO `newlabel` VALUES ('39', '测试------------', null, '2');
INSERT INTO `newlabel` VALUES ('41', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('43', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('44', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('45', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('46', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('47', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('48', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('49', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('50', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('51', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('52', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('53', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('55', '测试------------', null, '3');
INSERT INTO `newlabel` VALUES ('75', '父栏目测试', '66666666666', null);
INSERT INTO `newlabel` VALUES ('78', '啦啦啦啦啦', 'asdszcxczxczxczxc', '75');
INSERT INTO `newlabel` VALUES ('79', '子栏目也可以有子孙栏目', '子栏目也可以有子孙栏目子栏目也可以有子孙栏目子栏目也可以有子孙栏目子栏目也可以有子孙栏目子栏目也可以有子孙栏目', '75');

-- ----------------------------
-- Table structure for newmanage
-- ----------------------------
DROP TABLE IF EXISTS `newmanage`;
CREATE TABLE `newmanage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `labelid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` timestamp(6) NULL DEFAULT NULL,
  `suggest` text,
  `status` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newmanage
-- ----------------------------
INSERT INTO `newmanage` VALUES ('11', '1', '1', 'docker学习的入门', 'zzzzzzzzzzzzz', '2019-12-05 14:18:27.000000', '审核测试', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('12', '1', '3', 'scrapy爬52古装网高清壁纸并下载', '12333333333333333333', '2019-12-05 14:18:33.000000', '审核通过', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
INSERT INTO `newmanage` VALUES ('13', '1', '3', '博客笔记', '12231111111111', '2019-12-05 14:18:39.000000', '审核', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
INSERT INTO `newmanage` VALUES ('18', '1', '7', '武林风-----', '武林风-----武林风-----武林风-----', '2019-12-05 14:56:27.000000', '.........', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
INSERT INTO `newmanage` VALUES ('20', '1', '9', '武林风-----', '武林风-----武林风-----武林风-----武林风-----武林风-----武林风-----', '2019-12-05 14:57:02.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('21', '1', '75', 'docker学习的入门', 'assssssssssssssss', '2019-12-06 14:46:47.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('23', '1', '2', '67岁刘晓庆未修图反差大，见有人拍摄用暖手宝遮脸，助理上前挡镜头	', '\r\n刘晓庆一路走来经历过很多的大风大浪，在颜值这一块，她对自己要求似乎很高，很少有人拍到刘晓庆真实素颜的样子。其实对于艺人颜值衰老，粉丝们应该给予最大的理解，毕竟都会老去。 刘晓庆古装造型现身反差大，见镜头赶紧挡脸助理还撵人 自动播放 本文由娱乐八卦情报局原创，未经允许任何商业不得转载 12月5日，刘晓庆在微博上晒出了两张剧照，从照片中能看到，刘晓庆新剧造型非常霸气，手拿兵器，眼神犀利，被网友大赞有气场，能hold住任何造型。之前刘晓庆谈及“优雅的老去”，她认为为什么应该优雅的老去，刘晓庆一直不服老，并否认自己整容一说。 12月5日晚，有网友晒出了偶遇刘晓庆现身片场，从图中可以看到，刘晓庆穿着剧中衣服，发型还在头上，穿着也跟她自己晒出的剧照一样，车外面站着一男一女两位年轻的助理。 刘晓庆下车准备拍戏，这个时候可以看到，无美颜无滤镜下，真实的刘晓庆的脸，跟精修图有着天壤之别，脸上皮肤看起来也没那么好，毕竟已经60多岁的年纪。这个时候，刘晓庆看到对面有人拿着手机拍，下车的瞬间就赶紧拿着手里的暖手宝遮脸，不想被人拍到自己真实的样子吧。 就在这个时候，一旁的女助理发现了对面有人拍照，马上拿着手里的棉袄去挡镜头。这位拍照的网友当天还想找刘晓庆合影，不过很显然是被拒绝的。 刘晓庆一路走来经历过很多的大风大浪，在颜值这一块，她对自己要求似乎很高，很少有人拍到刘晓庆真实素颜的样子，看到被拍刘晓庆下意识用暖手袋遮脸，明显的不愿被拍，女助理反应如此迅速，看得出平时经常如此操作。其实对于艺人颜值衰老，粉丝们应该给予最大的理解，毕竟都会老去，你说呢？ 【免责声明：文中图片引用至网络，如有版权方请联系删除】\r\n\r\n ', '2019-12-06 15:01:07.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('24', '1', '1', 'a', 'a', '2019-12-13 10:42:13.000000', '', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
INSERT INTO `newmanage` VALUES ('25', '1', '1', 'a', 'a', '2019-12-13 10:42:18.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('26', '1', '1', 'a', 'a', '2019-12-13 10:42:23.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('27', '1', '1', 'a', 'a', '2019-12-13 10:42:27.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('28', '1', '1', 'a', 'a', '2019-12-13 10:42:31.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('29', '1', '1', 'a', 'a', '2019-12-13 10:42:35.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('30', '1', '1', 'a', 'a', '2019-12-13 10:43:46.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('31', '1', '2', 'a', 'a', '2019-12-13 10:43:51.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('32', '1', '2', 'a', 'a', '2019-12-13 10:43:55.000000', '', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
INSERT INTO `newmanage` VALUES ('33', '1', '2', 'a', ' abbb', '2019-12-13 10:43:59.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('35', '1', '2', 'asd', 'asd', '2019-12-15 11:03:49.000000', null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
INSERT INTO `newmanage` VALUES ('36', '1', '2', '啦啦啦啦啦', '啦啦啦啦啦', '2019-12-15 11:05:11.000000', '', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');

-- ----------------------------
-- Table structure for user_duty
-- ----------------------------
DROP TABLE IF EXISTS `user_duty`;
CREATE TABLE `user_duty` (
  `ID` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_duty
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `worktime` date DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `depid` int(11) DEFAULT NULL,
  `duty` char(2) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `homephone` varchar(20) DEFAULT NULL,
  `workphone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `MSN` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `httpaddress` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `logontime` date DEFAULT NULL,
  `lastlogontime` date DEFAULT NULL,
  `logoncount` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for work_help
-- ----------------------------
DROP TABLE IF EXISTS `work_help`;
CREATE TABLE `work_help` (
  `ID` int(11) NOT NULL,
  `file` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_help
-- ----------------------------

-- ----------------------------
-- Table structure for workmanage
-- ----------------------------
DROP TABLE IF EXISTS `workmanage`;
CREATE TABLE `workmanage` (
  `ID` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workmanage
-- ----------------------------
