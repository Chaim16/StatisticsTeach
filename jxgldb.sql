/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL_5_7
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : jxgldb

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/06/2020 22:31:39
*/ 

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bksktjx
-- ----------------------------
DROP TABLE IF EXISTS `bksktjx`;
CREATE TABLE `bksktjx`  (
  `bksktjx` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xq` int(1) NULL DEFAULT NULL COMMENT '学期',
  `kcmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `ktlxbm` int(2) NULL DEFAULT NULL COMMENT '课程类型编码',
  `skbj` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课班级',
  `sfsy` int(1) NULL DEFAULT NULL COMMENT '是否双语 0：不是，1：是',
  `jhxs` int(3) NULL DEFAULT NULL COMMENT '计划学时',
  `skrs` int(3) NULL DEFAULT NULL COMMENT '上课人数',
  `jxgzl` float(8, 1) NULL DEFAULT NULL COMMENT '课堂教学工作量总计',
  PRIMARY KEY (`bksktjx`) USING BTREE,
  INDEX `bksktjx_ibfk_1`(`gh`) USING BTREE,
  INDEX `bksktjx_ibfk_2`(`ktlxbm`) USING BTREE,
  CONSTRAINT `FK_bksktjx` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bksktjx_ibfk_2` FOREIGN KEY (`ktlxbm`) REFERENCES `kclx` (`ktlxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本科生课堂教学' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bkssjjx
-- ----------------------------
DROP TABLE IF EXISTS `bkssjjx`;
CREATE TABLE `bkssjjx`  (
  `bkssjjxid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `sxlxbm1` int(2) NULL DEFAULT NULL COMMENT '指导实习类型编码1',
  `sxts1` int(3) NULL DEFAULT NULL COMMENT '指导实习天数1',
  `sxlxbm2` int(2) NULL DEFAULT NULL COMMENT '实习类型编码2',
  `sxts2` int(3) NULL DEFAULT NULL COMMENT '指导实习天数2',
  `sxlxbm3` int(2) NULL DEFAULT NULL COMMENT '指导实习类型编码3',
  `sxts3` int(3) NULL DEFAULT NULL COMMENT '指导实习天数3',
  `wgsjrs` int(3) NULL DEFAULT NULL COMMENT '微格试讲人数',
  `zylxbm` int(2) NULL DEFAULT NULL COMMENT '专业类型编码',
  `zdlwrs` int(2) NULL DEFAULT NULL COMMENT '指导论文人数',
  `glnr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理内容',
  `glgzl` float(8, 1) NULL DEFAULT NULL COMMENT '管理工作量',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '实践教学工作量',
  PRIMARY KEY (`bkssjjxid`) USING BTREE,
  INDEX `bkssjjx_ibfk_1`(`gh`) USING BTREE,
  INDEX `bkssjjx_ibfk_2`(`sxlxbm1`) USING BTREE,
  INDEX `bkssjjx_ibfk_3`(`sxlxbm2`) USING BTREE,
  INDEX `bkssjjx_ibfk_4`(`sxlxbm3`) USING BTREE,
  INDEX `bkssjjx_ibfk_5`(`zylxbm`) USING BTREE,
  CONSTRAINT `bkssjjx_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bkssjjx_ibfk_2` FOREIGN KEY (`sxlxbm1`) REFERENCES `sxlx` (`sxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bkssjjx_ibfk_3` FOREIGN KEY (`sxlxbm2`) REFERENCES `sxlx` (`sxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bkssjjx_ibfk_4` FOREIGN KEY (`sxlxbm3`) REFERENCES `sxlx` (`sxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bkssjjx_ibfk_5` FOREIGN KEY (`zylxbm`) REFERENCES `zylxbm` (`zylxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本科生实践教学' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gwlxbm
-- ----------------------------
DROP TABLE IF EXISTS `gwlxbm`;
CREATE TABLE `gwlxbm`  (
  `gwlxbm` int(1) NOT NULL COMMENT '岗位类型编码',
  `gwlxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位类型名称',
  PRIMARY KEY (`gwlxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位类型编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gwlxbm
-- ----------------------------
INSERT INTO `gwlxbm` VALUES (1, '教学为主型');
INSERT INTO `gwlxbm` VALUES (2, '教学科研并重型');
INSERT INTO `gwlxbm` VALUES (3, '科研为主型');

-- ----------------------------
-- Table structure for hxxm
-- ----------------------------
DROP TABLE IF EXISTS `hxxm`;
CREATE TABLE `hxxm`  (
  `hxxmid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xmmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '横向项目名称',
  `dzjf` float(10, 2) NULL DEFAULT NULL COMMENT '到账经费',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '横向工作量',
  PRIMARY KEY (`hxxmid`) USING BTREE,
  INDEX `hxxm_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `hxxm_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '横向项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jbjsyxkjs
-- ----------------------------
DROP TABLE IF EXISTS `jbjsyxkjs`;
CREATE TABLE `jbjsyxkjs`  (
  `xkjsid` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `sfzxpyfa` int(1) NULL DEFAULT NULL COMMENT '是否撰写培养方案 0：未写 1：写',
  `kddgms` int(2) NULL DEFAULT NULL COMMENT '编写课堂大纲门数',
  `sydgms` int(2) NULL DEFAULT NULL COMMENT '实验大纲门数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '工作量',
  PRIMARY KEY (`xkjsid`) USING BTREE,
  INDEX `jbjsyxkjs_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `jbjsyxkjs_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基本建设与学科建设' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jbxx
-- ----------------------------
DROP TABLE IF EXISTS `jbxx`;
CREATE TABLE `jbxx`  (
  `jbxxid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `yxbm` int(2) NULL DEFAULT NULL COMMENT '院系编码',
  `zwbm` int(2) NULL DEFAULT NULL COMMENT '职务编码',
  `zcbm` int(2) NULL DEFAULT NULL COMMENT '职称编码',
  `gwlxbm` int(1) NULL DEFAULT NULL COMMENT '岗位类型编码',
  `sfxrz` int(1) NULL DEFAULT NULL COMMENT '是否新入职',
  `edgzl` float(8, 1) NULL DEFAULT NULL COMMENT '额定工作量',
  `bkszdsk` float(8, 1) NULL DEFAULT NULL COMMENT '本科生最低授课',
  PRIMARY KEY (`jbxxid`) USING BTREE,
  INDEX `jbxx_ibfk_1`(`gh`) USING BTREE,
  INDEX `jbxx_ibfk_2`(`yxbm`) USING BTREE,
  INDEX `jbxx_ibfk_3`(`zwbm`) USING BTREE,
  INDEX `jbxx_ibfk_4`(`zcbm`) USING BTREE,
  INDEX `jbxx_ibfk_5`(`gwlxbm`) USING BTREE,
  CONSTRAINT `jbxx_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jbxx_ibfk_2` FOREIGN KEY (`yxbm`) REFERENCES `yxbm` (`yxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jbxx_ibfk_3` FOREIGN KEY (`zwbm`) REFERENCES `zwbm` (`zwbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jbxx_ibfk_4` FOREIGN KEY (`zcbm`) REFERENCES `zcbm` (`zcbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jbxx_ibfk_5` FOREIGN KEY (`gwlxbm`) REFERENCES `gwlxbm` (`gwlxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jc
-- ----------------------------
DROP TABLE IF EXISTS `jc`;
CREATE TABLE `jc`  (
  `jcid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `jcmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教材名称',
  `jcjbbm` int(2) NULL DEFAULT NULL COMMENT '教材级别编码',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '编写教材工作量',
  PRIMARY KEY (`jcid`) USING BTREE,
  INDEX `jc_ibfk_1`(`gh`) USING BTREE,
  INDEX `jc_ibfk_2`(`jcjbbm`) USING BTREE,
  CONSTRAINT `jc_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jc_ibfk_2` FOREIGN KEY (`jcjbbm`) REFERENCES `jcjb` (`jcjbbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '编写教材工作流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jcjb
-- ----------------------------
DROP TABLE IF EXISTS `jcjb`;
CREATE TABLE `jcjb`  (
  `jcjbbm` int(10) NOT NULL,
  `jcjbmc` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教材级别名称',
  `gdgzl` int(5) NULL DEFAULT NULL COMMENT '规定工作量',
  PRIMARY KEY (`jcjbbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教材级别编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jcjb
-- ----------------------------
INSERT INTO `jcjb` VALUES (1, '国家级规划教材', 1000);
INSERT INTO `jcjb` VALUES (2, '省级规划教材', 200);
INSERT INTO `jcjb` VALUES (3, '国家级教材一等奖', 100);
INSERT INTO `jcjb` VALUES (4, '国家级教材二等奖', 500);
INSERT INTO `jcjb` VALUES (5, '国家级教材三等奖', 300);
INSERT INTO `jcjb` VALUES (6, '省级教材一等奖', 200);
INSERT INTO `jcjb` VALUES (7, '省级教材二等奖', 100);
INSERT INTO `jcjb` VALUES (8, '省级教材三等奖', 50);

-- ----------------------------
-- Table structure for jsdj
-- ----------------------------
DROP TABLE IF EXISTS `jsdj`;
CREATE TABLE `jsdj`  (
  `jsdjbm` int(2) NOT NULL COMMENT '教师竞赛等级编码',
  `jsdjmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师竞赛等级名称',
  `gdgzl` int(5) NULL DEFAULT NULL COMMENT '规定工作量',
  PRIMARY KEY (`jsdjbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师竞赛等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jsdj
-- ----------------------------
INSERT INTO `jsdj` VALUES (1, '国家级一等奖', 150);
INSERT INTO `jsdj` VALUES (2, '国家级二等奖', 100);
INSERT INTO `jsdj` VALUES (3, '国家级三等奖', 50);
INSERT INTO `jsdj` VALUES (4, '省级一等奖', 80);
INSERT INTO `jsdj` VALUES (5, '省级二等奖', 50);
INSERT INTO `jsdj` VALUES (6, '省级三等奖', 30);
INSERT INTO `jsdj` VALUES (7, '校级一等奖', 30);
INSERT INTO `jsdj` VALUES (8, '校级二等奖', 20);
INSERT INTO `jsdj` VALUES (9, '校级三等奖', 10);

-- ----------------------------
-- Table structure for jsjs
-- ----------------------------
DROP TABLE IF EXISTS `jsjs`;
CREATE TABLE `jsjs`  (
  `jsjsid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `jsmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛名称',
  `jsdjbm` int(2) NULL DEFAULT NULL COMMENT '竞赛等级编码',
  `jsxsbm` int(1) NULL DEFAULT NULL COMMENT '竞赛形式编码',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '教师竞赛工作量',
  PRIMARY KEY (`jsjsid`) USING BTREE,
  INDEX `jsjs_ibfk_1`(`gh`) USING BTREE,
  INDEX `jsjs_ibfk_2`(`jsdjbm`) USING BTREE,
  CONSTRAINT `jsjs_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jsjs_ibfk_2` FOREIGN KEY (`jsdjbm`) REFERENCES `jsdj` (`jsdjbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师竞赛工作量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jxcg
-- ----------------------------
DROP TABLE IF EXISTS `jxcg`;
CREATE TABLE `jxcg`  (
  `jxcgid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `cgmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成果名称',
  `cgdjbm` int(2) NULL DEFAULT NULL COMMENT '成果等级编码',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '教学成果参与人员总数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '教学成果工作量',
  PRIMARY KEY (`jxcgid`) USING BTREE,
  INDEX `jxcg_ibfk_1`(`gh`) USING BTREE,
  INDEX `jxcg_ibfk_2`(`cgdjbm`) USING BTREE,
  CONSTRAINT `jxcg_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jxcg_ibfk_2` FOREIGN KEY (`cgdjbm`) REFERENCES `jxcgdj` (`cgdjbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学成果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jxcgdj
-- ----------------------------
DROP TABLE IF EXISTS `jxcgdj`;
CREATE TABLE `jxcgdj`  (
  `cgdjbm` int(2) NOT NULL COMMENT '教学成果等级编码',
  `cgdjmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学成果等级名称',
  `gdgzl` int(5) NULL DEFAULT NULL COMMENT '规定工作量',
  PRIMARY KEY (`cgdjbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学成果等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jxcgdj
-- ----------------------------
INSERT INTO `jxcgdj` VALUES (1, '国家级特等奖', 2000);
INSERT INTO `jxcgdj` VALUES (2, '国家级一等奖', 1500);
INSERT INTO `jxcgdj` VALUES (3, '国家级二等奖', 1000);
INSERT INTO `jxcgdj` VALUES (4, '省部级特等奖', 500);
INSERT INTO `jxcgdj` VALUES (5, '省部级一等奖', 300);
INSERT INTO `jxcgdj` VALUES (6, '省部级二等奖', 200);
INSERT INTO `jxcgdj` VALUES (7, '省部级三等奖', 100);

-- ----------------------------
-- Table structure for jxgg
-- ----------------------------
DROP TABLE IF EXISTS `jxgg`;
CREATE TABLE `jxgg`  (
  `jxggid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xmmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `lxjbbm` int(2) NULL DEFAULT NULL COMMENT '立项级别编码',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '教学改革工作量',
  PRIMARY KEY (`jxggid`) USING BTREE,
  INDEX `jxgg_ibfk_1`(`gh`) USING BTREE,
  INDEX `jxgg_ibfk_2`(`lxjbbm`) USING BTREE,
  CONSTRAINT `jxgg_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jxgg_ibfk_2` FOREIGN KEY (`lxjbbm`) REFERENCES `lxjb` (`lxjbbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学改革' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kclx
-- ----------------------------
DROP TABLE IF EXISTS `kclx`;
CREATE TABLE `kclx`  (
  `ktlxbm` int(2) NOT NULL COMMENT '课程类型编码',
  `ktlxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型名称',
  `bzktrs` int(3) NULL DEFAULT NULL COMMENT '标准课堂人数',
  PRIMARY KEY (`ktlxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kclx
-- ----------------------------
INSERT INTO `kclx` VALUES (1, '公共课', 100);
INSERT INTO `kclx` VALUES (2, '公共教育类', 90);
INSERT INTO `kclx` VALUES (3, '公共语言类', 80);
INSERT INTO `kclx` VALUES (4, '公共计算机', 80);
INSERT INTO `kclx` VALUES (5, '公共艺术类', 80);
INSERT INTO `kclx` VALUES (6, '思想政治理论课', 50);
INSERT INTO `kclx` VALUES (7, '公共教技类', 50);
INSERT INTO `kclx` VALUES (8, '公共体育类', 50);
INSERT INTO `kclx` VALUES (9, '英语视听类', 50);
INSERT INTO `kclx` VALUES (10, '专业理论课', 50);
INSERT INTO `kclx` VALUES (11, '专业实验课', 20);
INSERT INTO `kclx` VALUES (12, '艺术专业术课', 20);
INSERT INTO `kclx` VALUES (13, '艺术类个别课', 2);

-- ----------------------------
-- Table structure for lxjb
-- ----------------------------
DROP TABLE IF EXISTS `lxjb`;
CREATE TABLE `lxjb`  (
  `lxjbbm` int(1) NOT NULL COMMENT '立项级别编码',
  `lxjbmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立项级别名称',
  `gdgzl` int(5) NULL DEFAULT NULL COMMENT '规定工作量',
  PRIMARY KEY (`lxjbbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学改革立项级别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lxjb
-- ----------------------------
INSERT INTO `lxjb` VALUES (1, '省级', 100);
INSERT INTO `lxjb` VALUES (2, '校级重点', 50);
INSERT INTO `lxjb` VALUES (3, '一般项目', 20);

-- ----------------------------
-- Table structure for qtjxgz
-- ----------------------------
DROP TABLE IF EXISTS `qtjxgz`;
CREATE TABLE `qtjxgz`  (
  `qtjxgzid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `ddgzl` float(8, 1) NULL DEFAULT NULL COMMENT '督导工作量',
  `bfxsrs` int(3) NULL DEFAULT NULL COMMENT '帮扶学生人数',
  `zdqnjsrs` int(3) NULL DEFAULT NULL COMMENT '指导青年教师人数',
  `xdrcpyfa` int(1) NULL DEFAULT NULL COMMENT '修订人才培养方案 0：未修改 1：修改',
  `kcdgms` int(3) NULL DEFAULT NULL COMMENT '修订课程大纲门数',
  `sydgms` int(3) NULL DEFAULT NULL COMMENT '修订实验大纲门数',
  `qtgzl` float(8, 1) NULL DEFAULT NULL COMMENT '其它工作量',
  PRIMARY KEY (`qtjxgzid`) USING BTREE,
  INDEX `qtjxgz_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `qtjxgz_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '其他教学工作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sxlx
-- ----------------------------
DROP TABLE IF EXISTS `sxlx`;
CREATE TABLE `sxlx`  (
  `sxlxbm` int(2) NOT NULL COMMENT '实习类型编码',
  `sxlxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习类型名称',
  PRIMARY KEY (`sxlxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实习类型编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxlx
-- ----------------------------
INSERT INTO `sxlx` VALUES (1, '驻点指导');
INSERT INTO `sxlx` VALUES (2, '非驻点指导');
INSERT INTO `sxlx` VALUES (3, '教育见习');
INSERT INTO `sxlx` VALUES (4, '生产见习');
INSERT INTO `sxlx` VALUES (5, '企业见习');
INSERT INTO `sxlx` VALUES (6, '田野作业');
INSERT INTO `sxlx` VALUES (7, '写生风采');

-- ----------------------------
-- Table structure for tjb
-- ----------------------------
DROP TABLE IF EXISTS `tjb`;
CREATE TABLE `tjb`  (
  `tjbid` int(11) NOT NULL AUTO_INCREMENT,
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师工号',
  `xm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `zw` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `yxmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系名称',
  `edgzl` float(8, 1) NULL DEFAULT NULL COMMENT '额定工作量',
  `bkszdsk` float(8, 2) NULL DEFAULT NULL COMMENT '本科生最低授课',
  `bksktgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生课堂工作量',
  `bkssjgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生实践工作量',
  `zlgcgzl` float(8, 1) NULL DEFAULT NULL COMMENT '质量工程工作量',
  `jxcggzl` float(8, 1) NULL DEFAULT NULL COMMENT '教学成果工作量',
  `bkszxxmgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生纵向项目工作量',
  `bkshxxmgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生横向项目工作量',
  `jcgzl` float(8, 1) NULL DEFAULT NULL COMMENT '教材工作量',
  `jxgggzl` float(8, 1) NULL DEFAULT NULL COMMENT '教学改革工作量',
  `bksjsgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生竞赛工作量',
  `jsjsgzl` float(8, 1) NULL DEFAULT NULL COMMENT '教师竞赛工作量',
  `bkslwgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生论文工作量',
  `bksqtgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生其它工作量',
  `bkszgzl` float(8, 1) NULL DEFAULT NULL COMMENT '本科生总工作量',
  `yjsktjxgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生课堂教学工作量',
  `jsjsjjxgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生实践教学工作量',
  `xkjsgzl` float(8, 1) NULL DEFAULT NULL COMMENT '学科建设工作量',
  `yjsjyxmgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生教研项目工作量',
  `yjshxxmgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生横向项目工作量',
  `yjslwgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生论文工作量',
  `yjsjsgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生竞赛工作量',
  `yjsqtgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生其它工作量',
  `yjszgzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生总工作量',
  `sjjxgzl` float(8, 1) NULL DEFAULT NULL COMMENT '实际教学工作量',
  `bksskwwc` float(8, 1) NULL DEFAULT NULL COMMENT '本科生授课未完成工作量',
  `edjxwwc` float(8, 1) NULL DEFAULT NULL COMMENT '额定教学未完成工作量',
  `shrgh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人工号',
  PRIMARY KEY (`tjbid`) USING BTREE,
  INDEX `tjb_ibfk_1`(`gh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tjzt
-- ----------------------------
DROP TABLE IF EXISTS `tjzt`;
CREATE TABLE `tjzt`  (
  `tijzid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `bkstjzt` int(1) NULL DEFAULT NULL COMMENT '提交状态',
  `bkstjsj` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `bksshzt` int(1) NULL DEFAULT NULL COMMENT '审核状态',
  `yxbksshrxm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系审核人姓名',
  `yxbksshsj` datetime(0) NULL DEFAULT NULL COMMENT '院系审核时间',
  `jwcshrxm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务处审核人姓名',
  `jwcshsj` datetime(0) NULL DEFAULT NULL COMMENT '教务处审核时间',
  `yjstjzt` int(1) NULL DEFAULT NULL,
  `yjstjsj` datetime(0) NULL DEFAULT NULL,
  `yjsshzt` int(1) NULL DEFAULT NULL,
  `yxyjsshrxm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yxyjsshsj` datetime(0) NULL DEFAULT NULL,
  `yjscshrxm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yjscshsj` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`tijzid`) USING BTREE,
  INDEX `tjzt_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `tjzt_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提交状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `yxbm` int(2) NULL DEFAULT NULL COMMENT '院系编码',
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `upassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `actor` int(2) NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`gh`) USING BTREE,
  INDEX `users_ibfk_1`(`yxbm`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`yxbm`) REFERENCES `yxbm` (`yxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('00000001', 15, 'deeper1', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('00000002', 15, 'deeper2', '0248491e86fbce782cf1878a5061c258', 2);
INSERT INTO `users` VALUES ('00000003', 22, 'deeper3', '0248491e86fbce782cf1878a5061c258', 3);
INSERT INTO `users` VALUES ('00000004', 15, 'deeper4', '0248491e86fbce782cf1878a5061c258', 4);
INSERT INTO `users` VALUES ('00000005', 21, 'deeper5', '0248491e86fbce782cf1878a5061c258', 5);
INSERT INTO `users` VALUES ('10101012', 25, '宋嗣军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101014', 25, '李立珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101017', 25, '吴芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101018', 11, '罗鸿飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101022', 2, '李洁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101026', 25, '叶莉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101028', 1, '崔永辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101029', 25, '周海琳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101032', 3, '刘刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101034', 25, '雷儒金', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101036', 25, '陶琦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101037', 2, '柯希进', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101039', 25, '王赛玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101041', 25, '余翔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101042', 25, '周启红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10101043', 25, '马列军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10102001', 25, '李厚新', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10102003', 2, '程焰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103002', 29, '梅友松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103003', 26, '安向清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103004', 6, '易桂姣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103005', 28, '蔡惠芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103006', 25, '余新', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103007', 15, '董元和\r\n', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103008', 2, '唐秀庚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10103009', 10, '柯静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10104002', 25, '陶晚成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10104003', 25, '胡小红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10105001', 29, '张平国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10105002', 5, '罗学玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10105004', 13, '黄海珠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10105006', 27, '张昌英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10105007', 26, '黄杨', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10106001', 28, '王军华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10106002', 28, '陈家顺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10106006', 28, '王国红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10106007', 6, '胡光波', '202cb962ac59075b964b07152d234b70', 1);
INSERT INTO `users` VALUES ('10107001', 25, '万里飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107003', 29, '张建梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107004', 25, '陈静茹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107005', 10, '刘飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107007', 29, '周景斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107008', 2, '杨邓红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10107010', 22, '代伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108002', 1, '徐燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108003', 18, '张惇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108005', 25, '王爱容', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108006', 25, '袁川', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108007', 25, '张望金', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108009', 25, '龚琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108013', 25, '胡艳桃', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108016', 25, '吴莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108017', 29, '徐晓琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108020', 26, '周萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108021', 1, '曹涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108022', 25, '高彩云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108023', 25, '施超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108024', 25, '邱军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108025', 25, '李芳芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108026', 25, '王鑫', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108027', 25, '陈福燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108029', 25, '张成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108030', 25, '朱莉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108034', 25, '黄彪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108035', 25, '陈荣芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10108036', 25, '何小环', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109003', 25, '章红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109004', 4, '陈强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109005', 22, '金俊兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109007', 22, '李丽华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109009', 21, '吕晓晴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109010', 18, '刘波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109012', 22, '孙成立', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109015', 15, '刘春容', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109016', 11, '刘江燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109018', 17, '孙慧君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109019', 25, '姜少平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109021', 22, '钱靖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10109022', 15, '董童立', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110001', 18, '石教磊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110005', 29, '汪燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110014', 2, '周黎明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110016', 29, '柯江为', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110022', 29, '黎孔琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110023', 29, '齐晓芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110024', 29, '郭华健', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110026', 29, '许恒', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110042', 29, '邹丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110043', 29, '张华声', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110045', 29, '王拾泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110046', 8, '臧海成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110047', 29, '范代森', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110051', 29, '汪陈莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110052', 29, '李炜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110053', 29, '陈玉莲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110058', 29, '项勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110065', 29, '顾光武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110066', 29, '杨丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110068', 29, '程国如', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10110071', 5, '饶坚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10111002', 1, '陈学章', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10111005', 8, '徐煜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112001', 29, '郑珂', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112002', 25, '闫春来', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112006', 25, '薛顺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112007', 25, '仇锋涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112008', 29, '徐新军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112009', 25, '徐星天', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10112010', 25, '杨诗莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113001', 5, '陈建鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113002', 18, '柯玲芬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113003', 2, '王泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113005', 25, '刘洋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113006', 26, '黄莘', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113007', 18, '赵晓毛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113009', 18, '李艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113011', 18, '肖赵华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113012', 18, '柯国生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113013', 12, '杨应华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113015', 18, '王海林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113017', 25, '朱颖琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113018', 18, '陈萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113019', 1, '王晴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113020', 4, '石文静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113021', 25, '邓黎崇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10113022', 18, '王麒', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114002', 29, '王勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114003', 25, '马戎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114004', 18, '涂瑜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114005', 13, '王超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114009', 29, '何光豪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114013', 29, '卢聪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114014', 29, '罗铁成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114015', 29, '周正强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114016', 29, '李双才', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114017', 29, '柯俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114018', 25, '程爽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114020', 25, '李智', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114022', 29, '王理', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114023', 25, '叶凯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114024', 29, '汪贵生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114025', 29, '胡东红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114032', 29, '皮悠悠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114034', 29, '唐冬梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114036', 29, '毕光辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10114042', 25, '周俊杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115001', 15, '王舒怀', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115002', 2, '丁桂兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115004', 29, '黄洪蔚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115005', 6, '严志谷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115007', 25, '胡燕生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115008', 12, '陈卓', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115012', 29, '李朝霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115015', 29, '马文翠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115016', 16, '方艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115019', 12, '吴萃', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115020', 25, '郑毅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115021', 25, '刘健', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115032', 6, '祝治国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115045', 25, '柯江峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115046', 29, '王金华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115048', 29, '谭红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10115052', 25, '刘爱楼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10116001', 8, '吴学海', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10116003', 25, '肖璇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10117002', 29, '万素梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10117006', 29, '周嵩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10118002', 12, '彭方英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10119001', 1, '王元汉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10119007', 25, '乐其超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10119008', 29, '王忠于', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10120002', 16, '陈文斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121003', 29, '李立长', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121004', 25, '张志华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121008', 2, '杨之毛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121009', 25, '赵卫军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121010', 25, '李先华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121019', 25, '李小林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121020', 25, '孙丹娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121025', 2, '叶曙平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121032', 25, '潘桂华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121033', 2, '杨学斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121034', 29, '张柏泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121039', 26, '王晓雪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121041', 22, '袁曼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121046', 29, '甘应良', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121048', 27, '张雪香', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121050', 29, '邹涌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121051', 7, '徐小容', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121052', 21, '刘雅琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121053', 25, '熊英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121054', 25, '刘懿钊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121058', 5, '王东博', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121059', 25, '刘雅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121060', 1, '高电玻', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121061', 25, '李文静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121062', 6, '王路成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121063', 25, '罗晓茜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121064', 7, '赵凯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121065', 21, '陈晨', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121066', 6, '刘红艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121067', 12, '侯功显', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121068', 25, '董延彪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121069', 23, '缪鑫', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121070', 25, '李佳炳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10121071', 25, '李琳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10122002', 26, '梁晓俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10122003', 13, '冯斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10122004', 15, '王陵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10122005', 27, '孙文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10123001', 25, '余涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10123002', 3, '徐明波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10123003', 7, '夏小维', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10123004', 14, '陈江华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10124001', 3, '程良道', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125013', 25, '李宏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125048', 17, '范安翔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125055', 1, '陈冬梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125056', 25, '胡红贵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125057', 25, '严海燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125059', 7, '杨钢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125061', 4, '杨冬伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125065', 6, '黄燕妮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125066', 10, '盛苏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125068', 3, '李艳苹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10125069', 5, '罗代华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10126002', 11, '余新武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10126003', 25, '海棠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10127002', 25, '朱崇军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10127005', 6, '赵亿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10128001', 18, '杨济铭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10128002', 25, '杨蕾', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10128005', 25, '王俨', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10129001', 7, '丰国欣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10129002', 25, '周建宇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10129003', 7, '项军平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10130002', 25, '陈欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10132001', 25, '艾湘', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201004', 2, '邵南征', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201006', 2, '杨明发', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201009', 1, '曾庆发', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201012', 1, '刘怀松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201016', 2, '周青山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201017', 2, '熊德仁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201022', 2, '王湘君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201023', 2, '刘慧频', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201024', 1, '汪火良', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201025', 2, '胡泰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201029', 2, '李定国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201031', 1, '吴谦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201033', 2, '陈敬中', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201034', 2, '陈幼华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201036', 2, '汪灿德', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201040', 1, '黄本莲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201041', 1, '陈向军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201042', 1, '李丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201044', 1, '黄梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201052', 2, '刘秋华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201057', 2, '邱海燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201058', 1, '江桂平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201059', 2, '郭琼花', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201062', 2, '刘元青', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201063', 2, '许爱凤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201064', 2, '郑矿文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201065', 2, '俞玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201066', 2, '黄造煌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201067', 1, '宋娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201068', 2, '翁艳琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201069', 2, '钱亚梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201070', 1, '吴昊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201071', 1, '饶晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201072', 1, '余楠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201073', 1, '陈细田', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201074', 1, '熊莉萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201075', 1, '王焱', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201077', 1, '喻亚平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201078', 1, '肖晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201079', 1, '王东伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201080', 1, '宁伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201081', 1, '冯灵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201083', 1, '周小光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10201084', 1, '王小丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202002', 25, '车录彬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202006', 6, '舒大清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202007', 6, '马芝兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202009', 6, '刘桂华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202010', 6, '胡淑芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202011', 6, '何求斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202015', 6, '景遐东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202019', 6, '彭江浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202022', 6, '李治平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202024', 6, '张玉玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202026', 6, '宫小兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202028', 6, '张道俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202029', 6, '黄宾主', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202030', 6, '李贤斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202031', 6, '陈欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202032', 6, '张卫兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202033', 6, '刘宝珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202034', 6, '李国英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202036', 6, '翁菊芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202037', 6, '马自泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202039', 6, '李永峻', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202041', 6, '姜金明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202042', 6, '贺义廉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202044', 6, '王胜国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202045', 6, '曾爱华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202046', 6, '晏亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202047', 6, '刘春花', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202050', 2, '胡刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202051', 6, '谢龙新', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202052', 6, '文彬彬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202053', 6, '严平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202055', 6, '唐祥勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202056', 6, '罗姝芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202057', 6, '余愿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202058', 6, '罗玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202059', 8, '应娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202060', 6, '袁小军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202062', 6, '王守雪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202063', 6, '李有光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202064', 6, '张鹏飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202065', 6, '吴福秀', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202066', 6, '赵爱武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202067', 25, '荆玉梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202070', 6, '吴剑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202071', 6, '杨文军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202073', 6, '王成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202074', 6, '蔡凌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202075', 6, '赵鹤玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202076', 25, '石相玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202077', 6, '黄芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202079', 6, '肖萌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202080', 6, '张力', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202082', 6, '曾羽霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202083', 6, '王玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202084', 6, '张艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202085', 6, '曾颖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202086', 6, '张才刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10202087', 6, '王再兴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203001', 7, '盛红梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203002', 7, '杜彩明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203004', 7, '赵艺红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203008', 7, '刘敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203009', 7, '李桂芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203011', 7, '夏文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203012', 26, '邱桂梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203013', 7, '秦海涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203014', 7, '郑桃云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203015', 7, '刘金梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203016', 7, '向波阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203017', 7, '南潮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203020', 7, '姜雪芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203021', 7, '王松槐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203022', 7, '胡泽刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203023', 7, '商志霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203024', 7, '李程', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203025', 7, '张传枝', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203027', 7, '潘亚萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203028', 7, '陈入云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203030', 7, '许红娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203031', 7, '程元益', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203032', 7, '李前', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203033', 7, '周海霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203034', 7, '王勣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203035', 7, '陈咏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203036', 7, '徐曼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203037', 7, '李端奇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203038', 7, '朱勇进', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203039', 7, '刘芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203040', 7, '陈君丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203041', 7, '唐凤华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203042', 7, '周小丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203044', 7, '王霜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203046', 7, '杨江华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203047', 7, '殷丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203048', 7, '王海燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203049', 7, '万丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203051', 7, '池欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203053', 7, '陈炽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203054', 7, '刘恋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203055', 7, '向群星', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203058', 7, '张小胜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203060', 7, '曹小为', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203065', 7, '龙友元', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203066', 7, '甘翠兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203067', 7, '胡晶晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203068', 7, '黄冬娇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203069', 7, '关长青', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203072', 7, '张志祥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203073', 7, '皮晓燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203075', 7, '高旭阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203077', 25, '曹建芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203078', 7, '宋丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203079', 7, '龚波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203081', 7, '罗敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203082', 7, '伍文忠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203084', 7, '喻劲梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203085', 7, '万琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203086', 7, '柯奇志', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203087', 7, '李琼华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203088', 7, '曹洁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203090', 7, '苏屹峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203091', 7, '刘辉宏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203093', 7, '姜玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203094', 7, '刘俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203095', 7, '欧阳方', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203097', 7, '王萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203098', 7, '张胜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203099', 7, '彭灵芝', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203100', 7, '肖作霖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203101', 7, '陈敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203102', 25, '彭舟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203103', 7, '董志浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203106', 7, '刘瑶瑶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203107', 4, '余云峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203108', 25, '王新忠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203109', 7, '陈嘉婧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203110', 7, '张姗姗', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203111', 7, '刘敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203112', 7, '程实', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203113', 7, '金玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203114', 7, '皮文立', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203115', 7, '吴畅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203116', 7, '徐宇婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203118', 7, '梁敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203119', 16, '朱璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203120', 7, '刘海燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203121', 25, '杨娇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203122', 7, '汪俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203123', 7, '阮迢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203134', 7, '向荣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203136', 7, '王璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203138', 7, '曾静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203139', 7, '黄真娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203140', 7, '刘冶琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203141', 7, '赵静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203142', 7, '龙缇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203143', 7, '张亚璇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203144', 7, '金高辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10203145', 7, '李娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204003', 8, '龚喜春', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204004', 8, '金平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204007', 8, '李建刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204008', 8, '张泰山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204010', 8, '蔡明伦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204013', 8, '刘千明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204015', 8, '朱移德', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204016', 8, '肖翠松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204018', 8, '尚平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204019', 8, '冯文娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204020', 8, '段丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204021', 8, '熊辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204022', 2, '杨金平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204023', 8, '郭在军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204024', 8, '钟祥虎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204025', 8, '李柏林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204027', 8, '刘建民', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204030', 8, '黄丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204031', 26, '熊曜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204032', 8, '吴擎华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204033', 8, '张强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204034', 8, '袁霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204036', 8, '郭笑笑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204037', 21, '张畅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204038', 8, '王军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204039', 8, '祝志芬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204040', 8, '王红玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204041', 8, '杨瑞军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204042', 8, '杨庆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204043', 8, '何小林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204044', 8, '庾君芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204045', 8, '尚永强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204046', 8, '陈乐保', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204047', 8, '汤玉婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204048', 8, '杨倩丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10204049', 8, '邱晓磊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205003', 9, '郑绿洲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205005', 28, '程文静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205007', 9, '李邦荣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205008', 9, '李必文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205009', 9, '左可正', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205010', 9, '胡松林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205012', 9, '潘继斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205015', 9, '陈敬华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205016', 9, '姜国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205018', 9, '程舰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205019', 9, '蔡择林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205021', 9, '柴国庆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205022', 9, '陈引兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205023', 9, '方芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205024', 9, '胡宏昌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205025', 25, '朱露露', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205027', 9, '徐望斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205028', 9, '徐立峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205029', 9, '江秉华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205030', 25, '李开灿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205031', 9, '李步云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205032', 9, '汪金汉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205033', 9, '吴方领', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205035', 9, '黄振华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205036', 9, '游雪肖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205037', 1, '李红湘', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205038', 17, '杨志丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205039', 9, '陈琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205040', 9, '谢涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205042', 9, '刘云芬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205043', 9, '赵大方', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205046', 9, '黄华平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205048', 9, '陈金阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205050', 9, '严慧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205051', 9, '王本成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205052', 9, '明巍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205053', 9, '刘浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205054', 1, '翟海霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205055', 25, '潘康', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205056', 9, '唐金艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205057', 9, '屈小妹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205058', 9, '刘超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205059', 9, '张金娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205060', 9, '吴爱龙', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205061', 9, '舒玉坤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205064', 9, '袁永新', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205065', 9, '刘伟明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205066', 9, '周海艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205067', 9, '王松柏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205068', 9, '甘露', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205069', 9, '黄收友', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205070', 9, '邹红林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205071', 9, '张霖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205072', 9, '陈鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10205073', 9, '胡建', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206002', 10, '朱松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206003', 10, '张道华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206004', 10, '李江林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206007', 10, '杨义发', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206008', 10, '丁逊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206009', 15, '程永山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206010', 10, '何惠华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206012', 15, '江国舟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206013', 10, '刘兴云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206014', 10, '江超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206015', 10, '刘红日', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206018', 10, '黄会玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206019', 10, '王秀章', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206020', 10, '余之松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206023', 10, '潘言全', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206024', 10, '高美珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206025', 10, '王中元', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206026', 10, '郑才龙', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206027', 10, '朱国良', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206029', 10, '张珑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206030', 10, '鲁池梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206035', 10, '单传家', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206036', 10, '李金星', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206037', 10, '侯向锋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206038', 10, '高瑜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206039', 10, '黎哲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206042', 10, '刘娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206043', 10, '刘继兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206044', 10, '王凤琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206045', 10, '雷婧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206046', 10, '陈曦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206047', 10, '刘昌宁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206048', 19, '刘美风', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206049', 10, '孙四梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206050', 10, '邢令义', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206052', 19, '杨伦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206053', 19, '谢波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206054', 19, '潘其云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206055', 19, '李翔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206056', 19, '韩娟娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206057', 10, '温建', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206058', 19, '赵念', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206059', 19, '谢云龙', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206060', 19, '刘易斯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206061', 10, '张乐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10206062', 19, '李中', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207003', 11, '易回阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207004', 11, '李小林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207005', 12, '王代芝', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207008', 11, '杨水金', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207010', 11, '郑静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207011', 11, '赖国松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207012', 11, '吕银华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207015', 11, '陈才元', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207021', 11, '汪敦佳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207022', 11, '韩德艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207024', 11, '王国宏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207025', 11, '胡胜利', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207026', 11, '白爱民', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207027', 11, '董镜华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207030', 11, '周兴旺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207031', 11, '王冬明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207035', 11, '张德华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207036', 12, '余中山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207038', 11, '王卫东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207039', 9, '罗四清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207040', 11, '陈芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207041', 11, '钟立群', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207042', 11, '邓真丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207043', 12, '高甲山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207044', 12, '胡巧开', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207045', 11, '吕宝兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207046', 11, '孙文兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207047', 11, '陈灵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207048', 11, '夏新泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207049', 11, '程银芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207050', 16, '李福宝', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207051', 11, '魏先红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207052', 11, '卢莲英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207053', 12, '王湖坤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207054', 11, '金传明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207055', 11, '吴一微', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207056', 12, '严素定', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207058', 11, '张浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207060', 11, '韩木先', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207062', 11, '胡艳军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207063', 25, '殷婷婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207064', 11, '范玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207065', 11, '王元花', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207066', 11, '殷国栋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207068', 9, '熊幼林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207069', 11, '张丽萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207070', 11, '程翠霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207071', 11, '马利娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207072', 11, '王娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207073', 11, '吴帅宾', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207074', 11, '黄小欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207075', 11, '吴奇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207076', 11, '姜诚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207077', 11, '陈金阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10207078', 11, '杜叶双', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208002', 13, '潘继承', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208004', 13, '邵锦震', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208006', 13, '涂俊铭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208007', 13, '李今', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208008', 13, '汪劲松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208011', 13, '江涓', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208012', 13, '支立峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208013', 13, '黄阜峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208014', 13, '王卫东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208015', 13, '董昌金', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208016', 13, '王友如', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208017', 13, '邱昌恩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208018', 13, '陈雄文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208020', 13, '徐平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208023', 13, '洪文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208025', 13, '匡鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208026', 13, '顾勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208027', 13, '余翔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208028', 13, '李京京', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208029', 13, '汤小胜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208031', 13, '倪明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208033', 13, '张润锋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208035', 13, '严镇钧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208036', 13, '胡远亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208037', 13, '陈珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208038', 13, '侯建军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208039', 25, '刘琼芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208040', 13, '苏平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208042', 13, '陈亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208044', 25, '刘广兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208046', 13, '李煜林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208047', 13, '张新潮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208050', 13, '刘细霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208051', 13, '李伟智', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208052', 13, '冯艳丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208053', 13, '彭千芮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208054', 13, '张斌斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208055', 13, '李刚华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208056', 13, '刘娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208057', 13, '陈云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208059', 13, '刘致浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208060', 13, '陈新鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10208061', 13, '金艳霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209002', 3, '李炎清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209003', 3, '曹中保', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209006', 3, '黄娅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209009', 3, '龚艺华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209010', 3, '谭雪晴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209011', 3, '邓李梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209014', 3, '王文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209017', 3, '胡凤霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209018', 2, '陈克娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209019', 3, '虞龙珠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209022', 3, '秦振飙', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209023', 3, '向光富', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209024', 2, '周艳华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209027', 3, '崔波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209029', 3, '魏源', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209030', 3, '柴霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209033', 3, '李智勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209037', 3, '马小芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209038', 3, '朱浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209039', 3, '余爱芹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209040', 3, '冯帮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209042', 3, '廖凌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209043', 16, '冀惠娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209044', 3, '张飞琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209046', 3, '何灿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209047', 3, '严春霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209048', 3, '周玲玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209049', 3, '汤广全', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209051', 3, '王琛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209052', 3, '桂勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209053', 3, '寻舒珊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209056', 3, '陈丹玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209057', 3, '张小菊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209059', 3, '李璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209060', 3, '朱培芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209061', 3, '张明平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209062', 3, '王明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209063', 3, '吴盼盼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209064', 3, '熊欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209065', 4, '胡天佑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209066', 3, '刘艳春', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209067', 3, '付光槐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209068', 3, '谭金凤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209069', 3, '陶丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10209070', 3, '邹从容', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210001', 15, '甘兴勋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210002', 15, '靳勇成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210003', 15, '张军翔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210005', 15, '杨绍文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210006', 15, '陈云红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210007', 15, '刘兴红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210008', 15, '李书明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210010', 15, '杨杏本', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210011', 15, '柯速约', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210012', 15, '杨素芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210014', 15, '刘文华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210016', 15, '黄海军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210018', 15, '徐海霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210020', 15, '梅斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210021', 15, '万莲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210023', 10, '黎明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210024', 21, '陈琦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210025', 25, '陈小露', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210027', 17, '明月', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210029', 15, '柯海燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210030', 15, '李丹丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210031', 15, '李全', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210032', 15, '程文山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210033', 6, '常璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210035', 15, '田文汇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210036', 15, '柯文燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210039', 15, '尚俊杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210040', 15, '向丹丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210041', 15, '严焰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210042', 15, '曹双双', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210043', 15, '李超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210045', 15, '付静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210046', 3, '许祖剑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210047', 4, '许新华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210050', 22, '陈静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210051', 15, '王晶晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210052', 15, '邓明华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10210053', 15, '朱文杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211004', 5, '张勇平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211005', 5, '刘中良', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211006', 5, '杜华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211008', 5, '凡新', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211009', 5, '彭鹰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211010', 27, '彭彦铭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211011', 5, '胡安义', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211012', 5, '汪颖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211013', 5, '华力', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211014', 5, '朱施成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211015', 5, '江奔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211016', 5, '刘世海', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211017', 5, '刘欧美', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211018', 5, '杜邦胜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211020', 5, '刘谦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211021', 5, '李平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211022', 5, '周曙', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211023', 5, '吴斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211024', 5, '刘劲松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211025', 5, '李玉玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211028', 11, '陈盼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211031', 5, '肖鸿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211032', 5, '张文锁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211033', 4, '张武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211035', 5, '李正中', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211037', 5, '潘丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211038', 5, '赵军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211039', 5, '陈杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211040', 5, '吴瑕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211041', 5, '胡乔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211042', 6, '罗曼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211043', 5, '袁静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211044', 5, '胡仲秋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211045', 5, '李志鸿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211046', 5, '刘璞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211048', 5, '冷显志', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211049', 5, '李宗香', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211050', 5, '潘燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211051', 5, '全晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211052', 5, '陈玉群', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211053', 5, '王伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211054', 5, '沈威', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211055', 25, '王媛媛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211058', 5, '焦美村', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211059', 5, '彭畅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211060', 5, '李恺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211061', 5, '占路', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211062', 5, '郅向东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211064', 5, '姜杭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211065', 5, '唐嘉岭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211067', 5, '李传兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211068', 5, '田启', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10211070', 5, '岳涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212003', 17, '郑惊涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212004', 17, '曾超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212005', 17, '李广南', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212006', 17, '叶猛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212007', 17, '朱华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212010', 17, '胡建清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212011', 17, '涂元生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212015', 17, '王勇刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212016', 17, '丁建武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212018', 17, '张志林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212019', 17, '朱强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212020', 17, '刘宏晖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212022', 17, '高锦峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212023', 17, '孔少波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212024', 17, '郭琛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212025', 17, '何盛雯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212026', 17, '郭喜安', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212027', 17, '孟亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212028', 17, '童斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212029', 17, '李杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('1021203', 17, '姚菁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212030', 17, '李永奎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212032', 17, '石磊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212035', 17, '王钟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212036', 17, '李方', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212037', 17, '孔庆君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212038', 17, '曹新刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212041', 17, '张鸿博', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212042', 17, '夏武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212043', 17, '施鹏程', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212044', 17, '谢欧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212045', 17, '韩祥翠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212046', 17, '蔡妮娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212048', 17, '王莉莉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212049', 17, '朱玲玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212051', 17, '刘晓光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212052', 17, '汪晓娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212053', 17, '任怡', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212055', 17, '陈媛媛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212057', 17, '王莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212058', 17, '刘玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212059', 17, '王慧娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212060', 17, '宋二崇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212061', 17, '尹璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212062', 17, '杨慧敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212063', 18, '余涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212066', 17, '成杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212068', 17, '龚忠玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212069', 17, '胡超', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212070', 17, '洪浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212072', 17, '李姗', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212073', 17, '石玉林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212074', 17, '程倩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212075', 17, '范晓颖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212076', 17, '夏路', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212078', 17, '蒋达', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212079', 17, '杨璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212080', 17, '卫鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212081', 17, '黄甲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212082', 17, '覃娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212083', 17, '莘月', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212085', 3, '唐静', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212086', 17, '杨金国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212087', 17, '吴秀丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212088', 17, '周国泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10212098', 17, '王忠民', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214001', 16, '韩莎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214003', 16, '何炜玮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214005', 16, '胡满春', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214006', 16, '徐晴岚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214007', 16, '黄芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214008', 2, '李光利', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214010', 16, '杨小丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214011', 16, '阮婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214013', 16, '李海萌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214014', 16, '许岳军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214017', 16, '张骥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214019', 9, '续林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214022', 16, '丁慧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214026', 16, '蒲实', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214027', 16, '杨艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214028', 16, '张金栋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214030', 16, '黄堠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214032', 16, '高月霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214033', 16, '夏天', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214034', 16, '李季', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214035', 16, '薛佳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214036', 16, '张蕾', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214037', 2, '夏婷婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214040', 16, '刘亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214041', 16, '张艺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214043', 16, '徐滢珺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214044', 16, '周玉娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214045', 16, '易秀华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214047', 16, '朱明明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214048', 16, '董欣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214049', 16, '袁蓓', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214050', 26, '朱春芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214051', 16, '刘桂桃', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214053', 29, '张美霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214056', 16, '李志成', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214057', 16, '贾春玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214058', 16, '伍方圆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214060', 16, '罗杨', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214062', 16, '柳冬瑕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214063', 16, '陈国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214064', 16, '杜蔚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214065', 16, '陈璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214066', 16, '胡丽君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214067', 16, '程洁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214068', 16, '邹少鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214069', 16, '朱敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214070', 16, '徐颖情', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214071', 16, '余传友', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214072', 16, '徐珍红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214073', 1, '王浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214074', 16, '刘鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214075', 16, '韩林彤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214655', 16, '段成瑶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214656', 29, '何成竹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214657', 16, '周友良', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214658', 16, '宋晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214659', 16, '席伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214660', 16, '任能亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214661', 16, '吕婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214662', 16, '董丽君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214663', 16, '向晶宝', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214665', 16, '刘娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214666', 16, '韩隆政', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214667', 16, '冯瑶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214668', 16, '张巍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10214669', 16, '蒋昊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215001', 14, '张先鹤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215002', 14, '刘金华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215004', 11, '罗玉梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215005', 14, '皮大能', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215006', 14, '高红亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215007', 14, '杨锦园', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215008', 14, '詹习生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215009', 14, '彭军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215010', 14, '吴杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215012', 6, '李筠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215013', 14, '涂建', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215014', 14, '万里光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215016', 14, '侯彩云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215018', 14, '叶梦君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215019', 14, '雷改惠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215020', 14, '杨青胜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215021', 14, '吴博', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215023', 14, '项灏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215024', 14, '姜晓伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215025', 14, '江波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215027', 14, '徐丰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215028', 14, '程琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215029', 14, '黄贞辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215031', 14, '朱军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215032', 14, '刘晨', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215034', 14, '汪玲彦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215036', 14, '韩涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10215037', 14, '何苗', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216002', 15, '林松', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216003', 15, '王曦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216005', 15, '丁一', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216008', 15, '彭绪富', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216010', 24, '石曙东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216012', 24, '石玮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216013', 15, '许新山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216014', 15, '柯宗武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216016', 15, '邢江', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216017', 15, '黄烜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216020', 15, '王建红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216021', 15, '李晓瑾', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216022', 15, '文富荣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216023', 15, '胡多勋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216025', 15, '孙玉霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216026', 15, '童强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216029', 15, '杨朋英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216030', 15, '童钰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216031', 1, '柳隽宇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216032', 15, '洪家平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216033', 15, '毛欲民', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216034', 15, '张国勇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216036', 15, '张行文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216037', 15, '付弦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216039', 15, '张大亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216040', 15, '李光敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216041', 15, '徐雄', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216042', 15, '杨怿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216044', 15, '黄琳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216045', 15, '汪崇文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216046', 15, '曹杉杉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216047', 15, '胡白燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216048', 15, '胡芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216049', 4, '徐小林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216050', 15, '曹华梁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216051', 15, '熊旭辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216053', 15, '段莉莉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216054', 15, '吴杉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216055', 15, '胡媛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216056', 15, '李优', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216057', 15, '陈洁洁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216058', 15, '易楞淦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216059', 15, '刘进军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10216060', 15, '程斌林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217001', 1, '肖六亿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217003', 1, '常婕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217004', 1, '叶亮军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217005', 1, '王君安', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217007', 1, '葛子明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217008', 1, '王浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217009', 1, '郑凯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217010', 1, '聂亚珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217011', 17, '李涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217017', 26, '詹晓燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217018', 1, '钟简', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217019', 1, '周芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217020', 1, '杜文晟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217025', 1, '陈燕和', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217027', 1, '陈泽慧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217028', 1, '陆文娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217029', 1, '邓光君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217030', 1, '沈燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217032', 1, '叶菁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217033', 25, '余松林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217034', 1, '易艳春', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217036', 1, '李波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217037', 1, '夏晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217038', 1, '江喜林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217039', 1, '颜永才', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217040', 1, '徐晔彪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217041', 1, '李小康', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217042', 1, '张莉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217043', 1, '蒋雨旺', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217044', 1, '曾近', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217046', 1, '赵贤利', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217047', 1, '刘丽娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217048', 1, '曹子瑛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10217049', 1, '李新光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218001', 2, '熊荣伍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218002', 12, '吴乐知', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218004', 12, '吴敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218006', 25, '邵幼岩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218007', 12, '尹发能', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218008', 12, '陈成忠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218009', 12, '葛绪广', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218012', 6, '陈敬道', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218013', 12, '翟晓芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218014', 12, '梁俊红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218015', 12, '桂智凡', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218016', 12, '刘定惠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218018', 12, '伍雄昌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218019', 12, '周家吉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218020', 12, '王娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218021', 12, '尹刚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218022', 12, '吴宏涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218023', 12, '朱亚乔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218024', 12, '朱华德', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218025', 12, '马啸', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218026', 12, '万远', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218027', 1, '戴欢欢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218028', 12, '吴晓东', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218029', 12, '林贵英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218030', 12, '宋基灵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10218031', 12, '吴伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219001', 2, '向夏莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219003', 2, '谭振义', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219004', 2, '江峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219005', 2, '李想', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219006', 2, '唐兴军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10219007', 2, '张耀天', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10221001', 25, '李欣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10221055', 8, '贺川子', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10221056', 25, '陈婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10221057', 15, '吴天真', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10221059', 25, '郭君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301003', 26, '左洪英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301004', 26, '杨杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301006', 26, '杨敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301008', 26, '史学斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301009', 29, '刘桂泉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301010', 17, '王榭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301011', 26, '黄子房', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301012', 26, '邓世明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301015', 26, '王红霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301016', 26, '罗严珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301017', 26, '刘晓芳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301018', 26, '张炳娥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301019', 26, '罗南', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301021', 26, '张春蕾', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301022', 26, '戴军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301024', 26, '吴学珍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301026', 26, '张凯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301027', 26, '张志强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301029', 26, '李琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301038', 26, '陈旻', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301039', 7, '彭建', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301040', 26, '魏晓鸣', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301046', 22, '熊中柳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301048', 26, '张帆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301049', 26, '付素琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301053', 26, '陶文萍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301055', 1, '郑荣臻', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301060', 26, '何靖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301065', 26, '赵先斌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301067', 26, '罗细玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301068', 26, '杨林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301069', 26, '黄金果', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301070', 26, '严安', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301071', 26, '刘春辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301072', 26, '高明磊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301074', 26, '王彩虹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301075', 26, '赖红艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301077', 26, '刘桂琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301078', 15, '潘敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301080', 26, '高红英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301081', 26, '赵文华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301082', 26, '袁钰莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301083', 24, '夏玮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10301084', 24, '李鹏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10302001', 14, '张国祥', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10302002', 15, '夏端峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10302005', 24, '饶龙坤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10302007', 26, '谭瀛舟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10302008', 15, '关卫军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303001', 11, '徐金光', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303003', 11, '孙婷荃', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303004', 11, '陶清', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303005', 11, '郑春阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303006', 11, '施少敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303007', 11, '周娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303008', 4, '欧阳宇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10303009', 11, '孙静俞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304001', 10, '田开坤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304002', 10, '李艳生', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304003', 10, '司佑全', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304004', 10, '彭琦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304006', 10, '祝秋文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304007', 10, '张学文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304008', 10, '黄燕霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304009', 10, '张少武', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304010', 25, '沈凌', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304011', 10, '郑瑛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304012', 10, '曹庭水', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304013', 10, '周兆丰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304014', 10, '李会容', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304015', 10, '赵朋义', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10304016', 10, '郭小珊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10305001', 22, '邓华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10305002', 2, '周秋莲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10509', 25, '王巍', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10511', 25, '吕露', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10512', 15, '金镭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10513', 25, '黄俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10606', 29, '阮慧琳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10609', 29, '王迎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10707', 29, '余淑琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('10708', 25, '仇凯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190001', 14, '陈兮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190002', 2, '王飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190003', 14, '蔡林', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190004', 10, '陈立', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190005', 12, '王丹丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190006', 3, '谢晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190007', 3, '鹿星南', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190008', 2, '杨灿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190009', 6, '王阅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190010', 12, '周香君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190011', 2, '王明为', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190012', 11, '徐程', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190013', 11, '李小云', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190014', 10, '刘海强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190015', 8, '熊锐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190016', 1, '王定星', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190017', 13, '夏险', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190018', 3, '赵幸', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190019', 11, '李雄建', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190020', 6, '李凡', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190021', 6, '吕文涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190022', 11, '周耀', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190023', 1, '覃业坤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190024', 13, '熊雨飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190025', 11, '滕春霖', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190026', 4, '席德强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190027', 12, '李立涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190028', 3, '周英杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190029', 8, '曾祥明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190030', 6, '沈月', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190031', 1, '徐光木', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190032', 15, '杨元华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('20190033', 7, '王姝茵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('2019XY01', 3, '涂艳国', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30090001', 21, '邹艳秋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30110001', 25, '王秀峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30110002', 25, '沈洋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30110003', 25, '张敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30110004', 25, '赵林霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30240001', 29, '李光辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30240002', 29, '苏伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30240003', 29, '鄢啸', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30240004', 29, '万慧君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30260001', 25, '张曼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('30260002', 25, '黄安琪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31010001', 1, '柯文轩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31010002', 1, '皮梦玉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31010003', 8, '万晶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31010004', 1, '刘紫君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31020002', 1, '丁书嫚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31030001', 2, '彭晓庆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31040001', 3, '江滢', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31040004', 3, '冯彤彤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31040005', 3, '张莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31040006', 3, '黄翠凤', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31040007', 3, '欧阳林霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31050001', 15, '杨海梅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31050003', 15, '胡梦雅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31060001', 5, '林春华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31080001', 7, '程芊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31080002', 7, '郭宏亮', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31080003', 7, '吴娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31080004', 7, '焦元诗', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31100001', 9, '郑晓', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110001', 10, '叶春英', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110002', 19, '金霞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110003', 19, '刘迎', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110004', 22, '冯雯', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110005', 10, '姜媛园', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110006', 10, '张平', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110007', 10, '方婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110008', 10, '汤思为', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31110009', 10, '张伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31150001', 14, '吴雨婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31150002', 14, '罗锦夫', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31170003', 16, '王深', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31170004', 16, '屈琬婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31180004', 17, '侯东旭', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('31180005', 17, '李琴', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('50101001', 3, '康馨如', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('99000001', 22, '教务处审核人', '0248491e86fbce782cf1878a5061c258', 3);
INSERT INTO `users` VALUES ('99000002', 15, '院系审核人', '0248491e86fbce782cf1878a5061c258', 2);
INSERT INTO `users` VALUES ('B2017006', 22, '童光聪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017071', 1, '聂娟娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017072', 6, '董晓明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017076', 13, '王晓玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017077', 13, '夏清强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017078', 13, '柯璐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017085', 17, '刘进', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017086', 17, '徐媛媛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017087', 16, '张科', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('B2017088', 16, '陈聪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201602', 8, '石倩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201603', 12, '程强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201604', 17, '侯怡', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201606', 12, '占瑛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201607', 14, '于俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201608', 14, '肖波', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201611', 3, '赵勇帅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201612', 8, '吴丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201614', 25, '许月明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201615', 16, '唐金羚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201617', 11, '李金懋', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201701', 25, '周权', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201702', 5, '江叶', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201704', 1, '吴琼', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201705', 14, '肖凌俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201706', 5, '葛毅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201707', 24, '毛智明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201709', 5, '李春艳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201710', 16, '余景涛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201711', 10, '严俊', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201712', 9, '吴丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201713', 25, '杨柳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201714', 7, '张仕佳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201715', 7, '杨美玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201716', 9, '孙茜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201717', 21, '张琳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201718', 8, '牟迪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201719', 1, '张中强', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201720', 3, '惠芬芬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201721', 1, '周勇飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201722', 14, '闫明星', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201723', 17, '梅骏伦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201724', 8, '柯梦琪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201725', 16, '唐天齐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201726', 15, '刘家伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201727', 5, '张战杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201728', 25, '李冬', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201729', 12, '王钰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201801', 17, '张潇丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201802', 5, '王婕如', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201803', 16, '邱天来', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201804', 25, '祖合然·艾克拜尔', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201805', 25, '伊力扎提·阿布里米提', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201806', 22, '张陆洲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201807', 25, '王艳丽', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201808', 22, '袁小燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201809', 25, '鲍锐娜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201810', 12, '宫桃子', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201811', 7, '涂亦乐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201812', 7, '丁航', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201813', 7, '艾玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201814', 14, '任小聪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201815', 15, '谭燕军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201816', 11, '吕剑', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201817', 1, '杨绍浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201818', 10, '刘佳音', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201819', 27, '岑露', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201821', 13, '李明兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201822', 13, '夏书明', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201823', 2, '陈恒全', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201824', 17, '张硕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201825', 22, '吴婷婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201826', 22, '陈佩佩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201827', 4, '段尧', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201828', 14, '胡惠敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201829', 17, '刘燕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201830', 17, '郭晓菁', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201831', 3, '王冲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201832', 3, '王云峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201834', 25, '谢苗苗', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201837', 23, '徐翠娟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201838', 14, '王梦茜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201839', 14, '李维', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201840', 16, '陈婷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201841', 15, '卫文婕', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201842', 25, '卢梦', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201843', 8, '许成香', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201844', 8, '黄梦帆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201845', 25, '王敏敏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201846', 7, '柯丹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201847', 15, '姚诗君', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201848', 15, '向阳', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201849', 9, '汪庆春', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201850', 6, '夏晓庆', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201851', 6, '刘骏', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201852', 10, '李卫', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201853', 10, '居思危', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201859', 13, '潘灵峰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201860', 1, '张振山', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201861', 1, '程立浩', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201862', 21, '黄圆媛', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201863', 7, '黄志军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201864', 1, '黄健', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201865', 22, '廖煜', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201866', 25, '黄亚', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201867', 16, '崔肖华', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201868', 16, '李晓荷', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201869', 15, '吴童玲', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201870', 15, '刘锐', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201871', 21, '王能杰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201872', 21, '肖庆莹', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201873', 12, '廖建军', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201874', 12, '郭文', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201878', 13, '肖本飞', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201879', 16, '黄景兰', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201880', 22, '张明红', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201882', 14, '张琪', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201884', 25, '朱妍娇', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201901', 16, '吴奇睿', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201902', 7, '万兵', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201903', 2, '赵丹惠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201904', 3, '郭文毅', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201905', 14, '王晋伟', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201906', 3, '郭楠楠', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201907', 25, '李辉', '0248491e86fbce782cf1878a5061c258', 1);
INSERT INTO `users` VALUES ('H1201908', 3, '张晨琛', '0248491e86fbce782cf1878a5061c258', 1);

-- ----------------------------
-- Table structure for yjshxxm
-- ----------------------------
DROP TABLE IF EXISTS `yjshxxm`;
CREATE TABLE `yjshxxm`  (
  `hxxmId` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xmmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `dzjf` float(8, 1) NULL DEFAULT NULL COMMENT '到账经费',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生横向项目工作量',
  PRIMARY KEY (`hxxmId`) USING BTREE,
  INDEX `yjshxxm_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `yjshxxm_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究生横向项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yjsjyxm
-- ----------------------------
DROP TABLE IF EXISTS `yjsjyxm`;
CREATE TABLE `yjsjyxm`  (
  `jyxmId` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xmmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `xmdjbm` int(2) NULL DEFAULT NULL COMMENT '项目等级编码',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生教研项目工作量',
  PRIMARY KEY (`jyxmId`) USING BTREE,
  INDEX `yjsjyxm_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `yjsjyxm_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究生教研项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yjskclx
-- ----------------------------
DROP TABLE IF EXISTS `yjskclx`;
CREATE TABLE `yjskclx`  (
  `kclxbm` int(2) NOT NULL,
  `kclxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bzktrs` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`kclxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yjskclx
-- ----------------------------
INSERT INTO `yjskclx` VALUES (1, '公共课', 32);
INSERT INTO `yjskclx` VALUES (2, '专业课', 16);
INSERT INTO `yjskclx` VALUES (3, '专业实践课', 8);

-- ----------------------------
-- Table structure for yjsktjx
-- ----------------------------
DROP TABLE IF EXISTS `yjsktjx`;
CREATE TABLE `yjsktjx`  (
  `yjsktjx` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xq` int(1) NULL DEFAULT NULL COMMENT '学期',
  `kcmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `kclx` int(2) NULL DEFAULT NULL COMMENT '课程类型编码',
  `skdx` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课对象',
  `jhxs` int(3) NULL DEFAULT NULL COMMENT '计划学时',
  `skrs` int(3) NULL DEFAULT NULL COMMENT '上课人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '课堂教学工作量',
  PRIMARY KEY (`yjsktjx`) USING BTREE,
  INDEX `yjsktjx_ibfk_1`(`gh`) USING BTREE,
  INDEX `yjsktjx_ibfk_2`(`kclx`) USING BTREE,
  CONSTRAINT `yjsktjx_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yjsktjx_ibfk_2` FOREIGN KEY (`kclx`) REFERENCES `yjskclx` (`kclxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究生课堂教学' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yjsqtjx
-- ----------------------------
DROP TABLE IF EXISTS `yjsqtjx`;
CREATE TABLE `yjsqtjx`  (
  `qtjxgzid` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `jxddgzl` float(8, 1) NULL DEFAULT NULL COMMENT '教学督导工作量',
  `mtfs` int(3) NULL DEFAULT NULL COMMENT '命题份数',
  `stfs` int(3) NULL DEFAULT NULL COMMENT '审题份数',
  `jdts` int(3) NULL DEFAULT NULL COMMENT '校对套数',
  `fsmskg` int(3) NULL DEFAULT NULL COMMENT '复试面试考官',
  `fsjkcs` int(3) NULL DEFAULT NULL COMMENT '复试监考次数',
  `yjfs` int(4) NULL DEFAULT NULL COMMENT '阅卷份数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生其它工作量',
  PRIMARY KEY (`qtjxgzid`) USING BTREE,
  INDEX `yjsqtjx_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `yjsqtjx_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究生其它教学工作量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yjssjjx
-- ----------------------------
DROP TABLE IF EXISTS `yjssjjx`;
CREATE TABLE `yjssjjx`  (
  `yjssjjxid` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `sjlxbm1` int(2) NULL DEFAULT NULL COMMENT '实践类型编码1',
  `sjts1` int(3) NULL DEFAULT NULL COMMENT '实践天数1',
  `sjlxbm2` int(2) NULL DEFAULT NULL COMMENT '实践类型编码2',
  `sjts2` int(3) NULL DEFAULT NULL COMMENT '实践天数2',
  `sjlxbm3` int(2) NULL DEFAULT NULL COMMENT '实践类型编码3',
  `sjts3` int(3) NULL DEFAULT NULL COMMENT '实践天数3',
  `zdxshdcs` int(3) NULL DEFAULT NULL COMMENT '指导学术活动次数',
  `rcgzsm` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常工作说明',
  `rcgzl` float(8, 1) NULL DEFAULT NULL COMMENT '日常工作量',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '研究生实践工作量',
  PRIMARY KEY (`yjssjjxid`) USING BTREE,
  INDEX `yjssjjx_ibfk_1`(`gh`) USING BTREE,
  INDEX `yjssjjx_ibfk_2`(`sjlxbm1`) USING BTREE,
  INDEX `yjssjjx_ibfk_3`(`sjlxbm2`) USING BTREE,
  INDEX `yjssjjx_ibfk_4`(`sjlxbm3`) USING BTREE,
  CONSTRAINT `yjssjjx_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yjssjjx_ibfk_2` FOREIGN KEY (`sjlxbm1`) REFERENCES `yjssxlxbm` (`yjssxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yjssjjx_ibfk_3` FOREIGN KEY (`sjlxbm2`) REFERENCES `yjssxlxbm` (`yjssxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yjssjjx_ibfk_4` FOREIGN KEY (`sjlxbm3`) REFERENCES `yjssxlxbm` (`yjssxlxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究生实践教学' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yjssxlxbm
-- ----------------------------
DROP TABLE IF EXISTS `yjssxlxbm`;
CREATE TABLE `yjssxlxbm`  (
  `yjssxlxbm` int(2) NOT NULL,
  `yjssxlxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`yjssxlxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yjssxlxbm
-- ----------------------------
INSERT INTO `yjssxlxbm` VALUES (1, '驻点指导');
INSERT INTO `yjssxlxbm` VALUES (2, '巡回指导');
INSERT INTO `yjssxlxbm` VALUES (3, '研究生工作站建设');
INSERT INTO `yjssxlxbm` VALUES (4, '实践基地建设');

-- ----------------------------
-- Table structure for yxbm
-- ----------------------------
DROP TABLE IF EXISTS `yxbm`;
CREATE TABLE `yxbm`  (
  `yxbm` int(2) NOT NULL COMMENT '院系编码',
  `yxmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系名称',
  PRIMARY KEY (`yxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '院系编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxbm
-- ----------------------------
INSERT INTO `yxbm` VALUES (1, '经济管理与法学院');
INSERT INTO `yxbm` VALUES (2, '马克思主义学院');
INSERT INTO `yxbm` VALUES (3, '教育科学学院');
INSERT INTO `yxbm` VALUES (4, '教师教育学院');
INSERT INTO `yxbm` VALUES (5, '体育学院');
INSERT INTO `yxbm` VALUES (6, '文学院');
INSERT INTO `yxbm` VALUES (7, '外国语学院');
INSERT INTO `yxbm` VALUES (8, '历史文化学院');
INSERT INTO `yxbm` VALUES (9, '数学与统计学院');
INSERT INTO `yxbm` VALUES (10, '物理与电子科学学院');
INSERT INTO `yxbm` VALUES (11, '化学化工学院');
INSERT INTO `yxbm` VALUES (12, '城市与环境学院');
INSERT INTO `yxbm` VALUES (13, '生命科学学院');
INSERT INTO `yxbm` VALUES (14, '机电与控制工程学院');
INSERT INTO `yxbm` VALUES (15, '计算机与信息工程学院');
INSERT INTO `yxbm` VALUES (16, '音乐学院');
INSERT INTO `yxbm` VALUES (17, '美术学院');
INSERT INTO `yxbm` VALUES (18, '继续教育学院');
INSERT INTO `yxbm` VALUES (19, '先进材料研究院');
INSERT INTO `yxbm` VALUES (21, '研究生院');
INSERT INTO `yxbm` VALUES (22, '教务处');
INSERT INTO `yxbm` VALUES (23, '科研处');
INSERT INTO `yxbm` VALUES (24, '信息化建设与管理中心');
INSERT INTO `yxbm` VALUES (25, '机关');
INSERT INTO `yxbm` VALUES (26, '图书馆');
INSERT INTO `yxbm` VALUES (27, '档案馆');
INSERT INTO `yxbm` VALUES (28, '学报编辑部');
INSERT INTO `yxbm` VALUES (29, '后勤及其他');

-- ----------------------------
-- Table structure for zcbm
-- ----------------------------
DROP TABLE IF EXISTS `zcbm`;
CREATE TABLE `zcbm`  (
  `zcbm` int(2) NOT NULL COMMENT '职称编码',
  `zcmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`zcbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职称编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zcbm
-- ----------------------------
INSERT INTO `zcbm` VALUES (1, '正高');
INSERT INTO `zcbm` VALUES (2, '副高');
INSERT INTO `zcbm` VALUES (3, '中级');
INSERT INTO `zcbm` VALUES (4, '初级');

-- ----------------------------
-- Table structure for zdsslw
-- ----------------------------
DROP TABLE IF EXISTS `zdsslw`;
CREATE TABLE `zdsslw`  (
  `zdsslwid` int(11) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(2) NULL DEFAULT NULL COMMENT '年度',
  `sylwrs` int(3) NULL DEFAULT NULL COMMENT '省优论文人数',
  `xylwrs` int(3) NULL DEFAULT NULL COMMENT '校优论文人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '指导研究生论文工作量',
  PRIMARY KEY (`zdsslwid`) USING BTREE,
  INDEX `zdsslw_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `zdsslw_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '指导硕士论文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zdxsjs
-- ----------------------------
DROP TABLE IF EXISTS `zdxsjs`;
CREATE TABLE `zdxsjs`  (
  `xsjsid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `jsmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛名称',
  `jslbbm` int(2) NULL DEFAULT NULL COMMENT '竞赛类别编码',
  `jsjbbm` int(1) NULL DEFAULT NULL COMMENT '竞赛级别编码',
  `zdxsrs` int(3) NULL DEFAULT NULL COMMENT '指导学生人数',
  `jsxscc` int(3) NULL DEFAULT NULL COMMENT '竞赛学生层次',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '指导学生竞赛工作量',
  PRIMARY KEY (`xsjsid`) USING BTREE,
  INDEX `zdxsjs_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `zdxsjs_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '指导学生竞赛' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zdxsjsgzl
-- ----------------------------
DROP TABLE IF EXISTS `zdxsjsgzl`;
CREATE TABLE `zdxsjsgzl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lbbm` int(11) NULL DEFAULT NULL,
  `jsjb` int(11) NULL DEFAULT NULL,
  `gzl` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zdxsjsgzl
-- ----------------------------
INSERT INTO `zdxsjsgzl` VALUES (1, 1, 1, 30);
INSERT INTO `zdxsjsgzl` VALUES (2, 1, 2, 15);
INSERT INTO `zdxsjsgzl` VALUES (3, 1, 3, 5);
INSERT INTO `zdxsjsgzl` VALUES (4, 2, 1, 15);
INSERT INTO `zdxsjsgzl` VALUES (5, 2, 2, 7.5);
INSERT INTO `zdxsjsgzl` VALUES (6, 2, 3, 2.5);
INSERT INTO `zdxsjsgzl` VALUES (7, 3, 1, 20);
INSERT INTO `zdxsjsgzl` VALUES (8, 3, 2, 10);
INSERT INTO `zdxsjsgzl` VALUES (9, 3, 3, 3);
INSERT INTO `zdxsjsgzl` VALUES (10, 4, 1, 10);
INSERT INTO `zdxsjsgzl` VALUES (11, 4, 2, 5);
INSERT INTO `zdxsjsgzl` VALUES (12, 4, 3, 1.5);

-- ----------------------------
-- Table structure for zdxslw
-- ----------------------------
DROP TABLE IF EXISTS `zdxslw`;
CREATE TABLE `zdxslw`  (
  `zdxslwid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `sylwrs` int(2) NULL DEFAULT NULL COMMENT '省优论文人数',
  `xylwrs` int(2) NULL DEFAULT NULL COMMENT '校优论文人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '指导学生竞赛工作量',
  PRIMARY KEY (`zdxslwid`) USING BTREE,
  INDEX `zdxslw_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `zdxslw_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '指导学生论文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlgc
-- ----------------------------
DROP TABLE IF EXISTS `zlgc`;
CREATE TABLE `zlgc`  (
  `zlgcid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `lxbm` int(2) NULL DEFAULT NULL COMMENT '项目类型编码',
  `xmmc` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `jb` int(1) NULL DEFAULT NULL COMMENT '级别 1 国家级 2 省级',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '质量工程工作量',
  PRIMARY KEY (`zlgcid`) USING BTREE,
  INDEX `zlgc_ibfk_1`(`gh`) USING BTREE,
  INDEX `zlgc_ibfk_2`(`lxbm`) USING BTREE,
  CONSTRAINT `zlgc_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zlgc_ibfk_2` FOREIGN KEY (`lxbm`) REFERENCES `zlgcxmlx` (`xmlxbm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量工程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlgcxmlx
-- ----------------------------
DROP TABLE IF EXISTS `zlgcxmlx`;
CREATE TABLE `zlgcxmlx`  (
  `xmlxbm` int(2) NOT NULL COMMENT '质量工程项目类型编码',
  `xmlxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型名称',
  PRIMARY KEY (`xmlxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量工程项目类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zlgcxmlx
-- ----------------------------
INSERT INTO `zlgcxmlx` VALUES (1, '一流专业');
INSERT INTO `zlgcxmlx` VALUES (2, '金课');
INSERT INTO `zlgcxmlx` VALUES (3, '品牌及特色专业');
INSERT INTO `zlgcxmlx` VALUES (4, '教学团队');
INSERT INTO `zlgcxmlx` VALUES (5, '实验教学中心');
INSERT INTO `zlgcxmlx` VALUES (6, '优质/精品课程');
INSERT INTO `zlgcxmlx` VALUES (7, '在线课程');
INSERT INTO `zlgcxmlx` VALUES (8, '资源共享');
INSERT INTO `zlgcxmlx` VALUES (9, '视频公开课程');
INSERT INTO `zlgcxmlx` VALUES (10, '大学生创新创业基地');
INSERT INTO `zlgcxmlx` VALUES (11, '大学生实习实训基地');
INSERT INTO `zlgcxmlx` VALUES (12, '湖北名师工作室');
INSERT INTO `zlgcxmlx` VALUES (13, '其他新增教学质量工程');

-- ----------------------------
-- Table structure for zwbm
-- ----------------------------
DROP TABLE IF EXISTS `zwbm`;
CREATE TABLE `zwbm`  (
  `zwbm` int(1) NOT NULL COMMENT '职务编码',
  `zwmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务名称',
  PRIMARY KEY (`zwbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职务编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zwbm
-- ----------------------------
INSERT INTO `zwbm` VALUES (1, '校级');
INSERT INTO `zwbm` VALUES (2, '副校级');
INSERT INTO `zwbm` VALUES (3, '处级');
INSERT INTO `zwbm` VALUES (4, '副处级');
INSERT INTO `zwbm` VALUES (5, '教研室主任');
INSERT INTO `zwbm` VALUES (6, NULL);

-- ----------------------------
-- Table structure for zxxm
-- ----------------------------
DROP TABLE IF EXISTS `zxxm`;
CREATE TABLE `zxxm`  (
  `zxxmid` int(10) NOT NULL AUTO_INCREMENT,
  `gh` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `nd` int(4) NULL DEFAULT NULL COMMENT '年度',
  `xmmc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纵向项目名称',
  `xmdjbm` int(1) NULL DEFAULT NULL COMMENT '项目等级编码',
  `xmpm` int(3) NULL DEFAULT NULL COMMENT '项目排名',
  `zrs` int(3) NULL DEFAULT NULL COMMENT '项目总人数',
  `gzl` float(8, 1) NULL DEFAULT NULL COMMENT '纵向项目工作量',
  PRIMARY KEY (`zxxmid`) USING BTREE,
  INDEX `zxxm_ibfk_2`(`xmdjbm`) USING BTREE,
  INDEX `zxxm_ibfk_1`(`gh`) USING BTREE,
  CONSTRAINT `zxxm_ibfk_1` FOREIGN KEY (`gh`) REFERENCES `users` (`gh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zxxm_ibfk_2` FOREIGN KEY (`xmdjbm`) REFERENCES `zxxmdj` (`xmdjbm`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '纵向项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zxxmdj
-- ----------------------------
DROP TABLE IF EXISTS `zxxmdj`;
CREATE TABLE `zxxmdj`  (
  `xmdjbm` int(2) NOT NULL COMMENT '纵向项目等级编码',
  `xmdjmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目等级',
  `gdgzl` int(5) NULL DEFAULT NULL COMMENT '规定工作量',
  PRIMARY KEY (`xmdjbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '纵向项目等级编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zxxmdj
-- ----------------------------
INSERT INTO `zxxmdj` VALUES (1, '国家级', 200);
INSERT INTO `zxxmdj` VALUES (2, '省级', 50);

-- ----------------------------
-- Table structure for zylxbm
-- ----------------------------
DROP TABLE IF EXISTS `zylxbm`;
CREATE TABLE `zylxbm`  (
  `zylxbm` int(2) NOT NULL,
  `zylxmc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`zylxbm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zylxbm
-- ----------------------------
INSERT INTO `zylxbm` VALUES (1, '文科(艺体)');
INSERT INTO `zylxbm` VALUES (2, '理科');
INSERT INTO `zylxbm` VALUES (3, '工科');
INSERT INTO `zylxbm` VALUES (4, '留学生');

-- ----------------------------
-- Procedure structure for proc_tj
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_tj`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_tj`(p_nd INT(4),p_gh CHAR(8))
    COMMENT '统计一个教师某年度的工作量'
BEGIN





 

  DECLARE  t_nd INT(4);              
  DECLARE  t_gh CHAR(8);             
  DECLARE  t_xm VARCHAR(20);        
  DECLARE  t_zw VARCHAR(10);        
  DECLARE  t_yxmc VARCHAR(50);      
  DECLARE  t_edgzl FLOAT(8,1);       
  DECLARE  t_bkszdsk FLOAT(8,1);    
  DECLARE  t_bksktgzl FLOAT(8,1);   
  DECLARE  t_bkssjgzl FLOAT(8,1);   
  DECLARE  t_zlgcgzl FLOAT(8,1);    
  DECLARE  t_jxcggzl FLOAT(8,1);    
  DECLARE  t_bkszxxmgzl FLOAT(8,1); 
  DECLARE  t_bkshxxmgzl FLOAT(8,1); 
  DECLARE  t_jcgzl FLOAT(8,1);      
  DECLARE  t_jxgggzl FLOAT(8,1);    
  DECLARE  t_bksjsgzl FLOAT(8,1);   
  DECLARE  t_jsjsgzl FLOAT(8,1);    
  DECLARE  t_bkslwgzl FLOAT(8,1);   
  DECLARE  t_bksqtgzl FLOAT(8,1);   
  DECLARE  t_bkszgzl FLOAT(8,1);    
  DECLARE  t_yjsktjxgzl FLOAT(8,1); 
  DECLARE  t_yjssjjxgzl FLOAT(8,1); 
  DECLARE  t_xkjsgzl FLOAT(8,1);    
  DECLARE  t_yjsjyxmgzl FLOAT(8,1); 
  DECLARE  t_yjshxxmgzl FLOAT(8,1); 
  DECLARE  t_yjslwgzl FLOAT(8,1);   
  DECLARE  t_yjsjsgzl FLOAT(8,1);   
  DECLARE  t_yjsqtgzl FLOAT(8,1);   
  DECLARE  t_yjszgzl FLOAT(8,1);    
  DECLARE  t_sjjxgzl FLOAT(8,1);    
  DECLARE  t_bkshskwwc FLOAT(8,1);  
  DECLARE  t_edjxwwc FLOAT(8,1);    

  DECLARE  v_not_found INT DEFAULT 0; 
  DECLARE  cur_jbxx CURSOR FOR 
     SELECT nd,jbxx.gh,uname,zwmc,yxmc,edgzl,bkszdsk
     FROM   jbxx,yxbm,zwbm,users
     WHERE jbxx.yxbm=yxbm.yxbm AND 
           jbxx.gh=users.gh AND
           jbxx.zwbm=zwbm.zwbm AND 
           jbxx.nd=p_nd AND
           jbxx.gh=p_gh;
             
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_not_found=1;

    
  DELETE FROM tjb  WHERE gh=p_gh AND nd=p_nd;
  OPEN cur_jbxx;
  FETCH cur_jbxx INTO t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk; 
  WHILE v_not_found=0 DO  
        
    SELECT SUM(jxgzl) INTO t_bksktgzl FROM bksktjx WHERE gh=t_gh AND nd=p_nd;    
    IF (t_bksktgzl IS NULL) THEN
        SET t_bksktgzl=0;    
    END IF;     
    
    SELECT SUM(gzl)   INTO t_bkssjgzl   FROM bkssjjx WHERE gh=t_gh AND nd=p_nd;    
    IF (t_bkssjgzl IS NULL) THEN
       SET t_bkssjgzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_zlgcgzl    FROM zlgc WHERE gh=t_gh AND nd=p_nd;    
    IF (t_zlgcgzl IS NULL) THEN
        SET t_zlgcgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jxcggzl    FROM jxcg WHERE gh=t_gh AND nd=p_nd;
    IF (t_jxcggzl IS NULL) THEN
        SET t_jxcggzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bkszxxmgzl FROM zxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkszxxmgzl IS NULL) THEN
        SET t_bkszxxmgzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bkshxxmgzl FROM hxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkshxxmgzl IS NULL) THEN
        SET t_bkshxxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jcgzl FROM jc WHERE gh=t_gh AND nd=p_nd;
    IF (t_jcgzl IS NULL) THEN
        SET t_jcgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jxgggzl FROM jxgg WHERE gh=t_gh AND nd=p_nd;
    IF (t_jxgggzl IS NULL) THEN
        SET t_jxgggzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bksjsgzl FROM zdxsjs WHERE jsxscc=1 AND gh=t_gh AND nd=p_nd;
    IF (t_bksjsgzl IS NULL) THEN
        SET t_bksjsgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jsjsgzl FROM jsjs WHERE gh=t_gh AND nd=p_nd; 
    IF (t_jsjsgzl IS NULL) THEN
       SET t_jsjsgzl=0;     
    END IF;  
    
    SELECT SUM(gzl)   INTO t_bkslwgzl FROM zdxslw WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkslwgzl IS NULL) THEN
        SET t_bkslwgzl=0;
    END IF; 
    
    SELECT SUM(qtgzl) INTO t_bksqtgzl FROM qtjxgz WHERE gh=t_gh AND nd=p_nd;
    IF (t_bksqtgzl IS NULL) THEN
        SET t_bksqtgzl=0;
    END IF; 
    
    SET t_bkszgzl=t_bksktgzl+t_bkssjgzl+t_zlgcgzl+t_jxcggzl+ 
                  t_bkszxxmgzl+t_bkshxxmgzl+t_jcgzl+t_jxgggzl+
                  t_bksjsgzl+t_jsjsgzl+t_bkslwgzl+t_bksqtgzl;     
    
    SELECT SUM(gzl)   INTO t_yjsktjxgzl FROM yjsktjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsktjxgzl IS NULL) THEN
        SET t_yjsktjxgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjssjjxgzl FROM yjssjjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjssjjxgzl IS NULL) THEN
        SET t_yjssjjxgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_xkjsgzl  FROM jbjsyxkjs WHERE gh=t_gh AND nd=p_nd;
    IF (t_xkjsgzl IS NULL) THEN
        SET t_xkjsgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjsjyxmgzl FROM yjsjyxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsjyxmgzl IS NULL) THEN
        SET t_yjsjyxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjshxxmgzl FROM yjshxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjshxxmgzl IS NULL) THEN
        SET t_yjshxxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)  INTO t_yjslwgzl  FROM zdsslw WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjslwgzl IS NULL) THEN
        SET t_yjslwgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjsjsgzl FROM zdxsjs WHERE jsxscc=2 AND gh=t_gh AND nd=p_nd;
    IF (t_yjsjsgzl IS NULL) THEN
        SET t_yjsjsgzl=0;
    END IF; 
    SELECT SUM(gzl)   INTO t_yjsqtgzl FROM yjsqtjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsqtgzl IS NULL) THEN
        SET t_yjsqtgzl=0;
    END IF; 
 
   
    SET t_yjszgzl=t_yjsktjxgzl+t_yjssjjxgzl+t_xkjsgzl+t_yjsjyxmgzl+
                  t_yjshxxmgzl+t_yjslwgzl+t_yjsjsgzl+t_yjsqtgzl;
 
    
    SET t_sjjxgzl=t_bkszgzl+t_yjszgzl;

    
    SET t_bkshskwwc=t_bkszdsk-t_bksktgzl;
    IF t_bkshskwwc<0 THEN
     SET t_bkshskwwc=0; 
    END IF;
        
    SET t_edjxwwc=t_edgzl-t_sjjxgzl;    
    IF t_edjxwwc<0 THEN
       SET t_edjxwwc=0;
    END IF;
    INSERT INTO tjb(nd,gh,xm,zw,yxmc,edgzl,bkszdsk,bksktgzl,bkssjgzl,zlgcgzl,jxcggzl,bkszxxmgzl,
                bkshxxmgzl,jcgzl,jxgggzl,bksjsgzl,jsjsgzl,bkslwgzl,bksqtgzl,bkszgzl,yjsktjxgzl,
                jsjsjjxgzl,xkjsgzl,yjsjyxmgzl,yjshxxmgzl,yjslwgzl,yjsjsgzl,yjsqtgzl,yjszgzl,sjjxgzl,
                bksskwwc,edjxwwc)
    VALUES(t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk,t_bksktgzl,t_bkssjgzl,t_zlgcgzl,t_jxcggzl,
           t_bkszxxmgzl,t_bkshxxmgzl,t_jcgzl,t_jxgggzl,t_bksjsgzl,t_jsjsgzl,t_bkslwgzl,t_bksqtgzl,
           t_bkszgzl,t_yjsktjxgzl,t_yjssjjxgzl,t_xkjsgzl,t_yjsjyxmgzl,t_yjshxxmgzl,t_yjslwgzl,
           t_yjsjsgzl,t_yjsqtgzl,t_yjszgzl,t_sjjxgzl,t_bkshskwwc,t_edjxwwc);
  
 FETCH cur_jbxx INTO t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk; 
  END WHILE;  
  CLOSE cur_jbxx; 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
