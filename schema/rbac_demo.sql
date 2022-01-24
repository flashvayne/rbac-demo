/*
Navicat MySQL Data Transfer

Source Server         : pi
Source Server Version : 80025
Source Host           : pi:3306
Source Database       : rbac_demo

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-01-24 21:18:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rbac_resource
-- ----------------------------
DROP TABLE IF EXISTS `rbac_resource`;
CREATE TABLE `rbac_resource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `type` tinyint NOT NULL COMMENT '类型 1.接口 2.菜单',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源标识/地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rbac_resource
-- ----------------------------
INSERT INTO `rbac_resource` VALUES ('1', '1', '学生列表', '/student/list', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_resource` VALUES ('2', '1', '教师列表', '/teacher/list', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `id` int NOT NULL COMMENT '角色id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES ('1', '班主任', '可管理学生信息', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_role` VALUES ('2', '教务主任', '可管理教师和学生信息', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for rbac_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_resource`;
CREATE TABLE `rbac_role_resource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_id` int NOT NULL COMMENT '角色id',
  `resource_id` int NOT NULL COMMENT '资源id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_resource` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rbac_role_resource
-- ----------------------------
INSERT INTO `rbac_role_resource` VALUES ('1', '1', '1', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_role_resource` VALUES ('2', '2', '1', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_role_resource` VALUES ('3', '2', '2', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0.正常 1.禁用',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rbac_user
-- ----------------------------
INSERT INTO `rbac_user` VALUES ('1', 'bzr', '班主任', '123456', '0', '13811112222', '1234@qq.com', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_user` VALUES ('2', 'jwzr', '教务主任', '123456', '0', '13811112222', '1234@qq.com', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for rbac_user_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user_role`;
CREATE TABLE `rbac_user_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_role` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rbac_user_role
-- ----------------------------
INSERT INTO `rbac_user_role` VALUES ('1', 'bzr', '1', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `rbac_user_role` VALUES ('2', 'jwzr', '2', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `age` int DEFAULT NULL COMMENT '年龄',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '李梦琪', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('2', '李忆柳', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('3', '李之桃', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('4', '李慕青', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('5', '李问兰', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('6', '李尔岚', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('7', '李元香', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('8', '李初夏', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('9', '李沛菡', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('10', '李傲珊', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('11', '李曼文', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('12', '李乐菱', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('13', '李痴珊', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('14', '李恨玉', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('15', '李惜文', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('16', '李香寒', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('17', '李新柔', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('18', '李语蓉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('19', '李海安', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('20', '李夜蓉', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('21', '李涵柏', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('22', '李水桃', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('23', '李醉蓝', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('24', '李春儿', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('25', '李语琴', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('26', '李从彤', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('27', '李傲晴', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('28', '李语兰', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('29', '李又菱', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('30', '李碧彤', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('31', '李元霜', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('32', '李怜梦', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('33', '李紫寒', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('34', '李妙彤', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('35', '李曼易', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('36', '李南莲', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('37', '李紫翠', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('38', '李雨寒', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('39', '李易烟', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('40', '李如萱', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('41', '李若南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('42', '李寻真', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('43', '李晓亦', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('44', '李向珊', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('45', '李慕灵', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('46', '李以蕊', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('47', '李寻雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('48', '李映易', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('49', '李雪柳', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('50', '李孤岚', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('51', '李笑霜', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('52', '李海云', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('53', '李凝天', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('54', '李沛珊', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('55', '李寒云', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('56', '李冰旋', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('57', '李宛儿', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('58', '李绿真', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('59', '李盼儿', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('60', '李晓霜', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('61', '李碧凡', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('62', '李夏菡', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('63', '李曼香', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('64', '李若烟', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('65', '李半梦', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('66', '李雅绿', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('67', '李冰蓝', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('68', '李灵槐', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('69', '李平安', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('70', '李书翠', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('71', '李翠风', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('72', '李香巧', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('73', '李代云', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('74', '李梦曼', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('75', '李幼翠', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('76', '李友巧', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('77', '李听寒', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('78', '李梦柏', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('79', '李醉易', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('80', '李访旋', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('81', '李亦玉', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('82', '李凌萱', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('83', '李访卉', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('84', '李怀亦', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('85', '李笑蓝', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('86', '李春翠', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('87', '李靖柏', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('88', '李夜蕾', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('89', '李冰夏', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('90', '李梦松', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('91', '李书雪', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('92', '李乐枫', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('93', '李念薇', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('94', '李靖雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('95', '李寻春', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('96', '李恨山', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('97', '李从寒', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('98', '李忆香', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('99', '李觅波', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('100', '李静曼', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('101', '李凡旋', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('102', '李以亦', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('103', '李念露', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('104', '李芷蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('105', '李千兰', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('106', '李新波', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('107', '李代真', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('108', '李新蕾', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('109', '李雁玉', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('110', '李冷卉', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('111', '李紫山', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('112', '李千琴', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('113', '李恨天', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('114', '李傲芙', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('115', '李盼山', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('116', '李怀蝶', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('117', '李冰兰', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('118', '李山柏', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('119', '李翠萱', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('120', '李恨松', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('121', '李问旋', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('122', '李从南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('123', '李白易', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('124', '李问筠', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('125', '李如霜', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('126', '李半芹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('127', '李丹珍', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('128', '李冰彤', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('129', '李亦寒', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('130', '李寒雁', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('131', '李怜云', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('132', '李寻文', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('133', '李乐丹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('134', '李翠柔', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('135', '李谷山', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('136', '李之瑶', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('137', '李冰露', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('138', '李尔珍', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('139', '李谷雪', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('140', '李乐萱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('141', '李涵菡', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('142', '李海莲', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('143', '李傲蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('144', '李青槐', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('145', '李冬儿', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('146', '李易梦', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('147', '李惜雪', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('148', '李宛海', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('149', '李之柔', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('150', '李夏青', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('151', '李亦瑶', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('152', '李妙菡', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('153', '李春竹', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('154', '李痴梦', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('155', '李紫蓝', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('156', '李晓巧', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('157', '李幻柏', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('158', '李元风', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('159', '李冰枫', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('160', '李访蕊', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('161', '李南春', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('162', '李芷蕊', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('163', '李凡蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('164', '李凡柔', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('165', '李安蕾', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('166', '李天荷', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('167', '李含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('168', '李书兰', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('169', '李雅琴', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('170', '李书瑶', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('171', '李春雁', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('172', '李从安', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('173', '李夏槐', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('174', '李念芹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('175', '李怀萍', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('176', '李代曼', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('177', '李幻珊', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('178', '李谷丝', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('179', '李秋翠', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('180', '李白晴', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('181', '李海露', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('182', '李代荷', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('183', '李含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('184', '李书蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('185', '李听白', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('186', '李访琴', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('187', '李灵雁', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('188', '李秋春', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('189', '李雪青', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('190', '李乐瑶', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('191', '李含烟', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('192', '李涵双', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('193', '李平蝶', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('194', '李雅蕊', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('195', '李傲之', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('196', '李灵薇', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('197', '李绿春', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('198', '李含蕾', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('199', '李从梦', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('200', '李从蓉', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('201', '李初丹', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('202', '李听兰', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('203', '李听蓉', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('204', '李语芙', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('205', '李夏彤', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('206', '李凌瑶', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('207', '李忆翠', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('208', '李幻灵', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('209', '李怜菡', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('210', '李紫南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('211', '李依珊', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('212', '李妙竹', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('213', '李访烟', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('214', '李怜蕾', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('215', '李映寒', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('216', '李友绿', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('217', '李冰萍', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('218', '李惜霜', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('219', '李凌香', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('220', '李芷蕾', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('221', '李雁卉', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('222', '李迎梦', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('223', '李元柏', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('224', '李代萱', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('225', '李紫真', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('226', '李千青', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('227', '李凌寒', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('228', '李紫安', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('229', '李寒安', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('230', '李怀蕊', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('231', '李秋荷', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('232', '李涵雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('233', '李以山', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('234', '李凡梅', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('235', '李盼曼', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('236', '李翠彤', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('237', '李谷冬', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('238', '李新巧', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('239', '李冷安', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('240', '李千萍', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('241', '李冰烟', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('242', '李雅阳', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('243', '李友绿', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('244', '李南松', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('245', '李诗云', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('246', '李飞风', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('247', '李寄灵', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('248', '李书芹', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('249', '李幼蓉', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('250', '李以蓝', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('251', '李笑寒', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('252', '李忆寒', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('253', '李秋烟', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('254', '李芷巧', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('255', '李水香', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('256', '李映之', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('257', '李醉波', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('258', '李幻莲', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('259', '李夜山', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('260', '李芷卉', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('261', '李向彤', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('262', '李小玉', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('263', '李幼南', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('264', '李凡梦', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('265', '李尔曼', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('266', '李念波', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('267', '李迎松', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('268', '李青寒', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('269', '李笑天', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('270', '李涵蕾', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('271', '李碧菡', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('272', '李映秋', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('273', '李盼烟', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('274', '李忆山', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('275', '李以寒', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('276', '李寒香', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('277', '李小凡', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('278', '李代亦', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('279', '李梦露', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('280', '李映波', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('281', '李友蕊', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('282', '李寄凡', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('283', '李怜蕾', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('284', '李雁枫', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('285', '李水绿', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('286', '李曼荷', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('287', '李笑珊', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('288', '李寒珊', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('289', '李谷南', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('290', '李慕儿', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('291', '李夏岚', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('292', '李友儿', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('293', '李小萱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('294', '李紫青', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('295', '李妙菱', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('296', '李冬寒', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('297', '李曼柔', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('298', '李语蝶', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('299', '李青筠', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('300', '李夜安', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('301', '李觅海', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('302', '李问安', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('303', '李晓槐', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('304', '李雅山', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('305', '李访云', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('306', '李翠容', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('307', '李寒凡', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('308', '李晓绿', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('309', '李以菱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('310', '李冬云', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('311', '李含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `student` VALUES ('312', '李访枫', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `age` int DEFAULT NULL COMMENT '年龄',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '王梦琪', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('2', '王忆柳', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('3', '王之桃', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('4', '王慕青', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('5', '王问兰', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('6', '王尔岚', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('7', '王元香', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('8', '王初夏', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('9', '王沛菡', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('10', '王傲珊', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('11', '王曼文', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('12', '王乐菱', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('13', '王痴珊', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('14', '王恨玉', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('15', '王惜文', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('16', '王香寒', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('17', '王新柔', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('18', '王语蓉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('19', '王海安', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('20', '王夜蓉', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('21', '王涵柏', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('22', '王水桃', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('23', '王醉蓝', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('24', '王春儿', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('25', '王语琴', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('26', '王从彤', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('27', '王傲晴', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('28', '王语兰', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('29', '王又菱', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('30', '王碧彤', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('31', '王元霜', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('32', '王怜梦', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('33', '王紫寒', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('34', '王妙彤', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('35', '王曼易', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('36', '王南莲', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('37', '王紫翠', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('38', '王雨寒', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('39', '王易烟', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('40', '王如萱', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('41', '王若南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('42', '王寻真', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('43', '王晓亦', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('44', '王向珊', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('45', '王慕灵', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('46', '王以蕊', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('47', '王寻雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('48', '王映易', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('49', '王雪柳', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('50', '王孤岚', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('51', '王笑霜', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('52', '王海云', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('53', '王凝天', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('54', '王沛珊', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('55', '王寒云', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('56', '王冰旋', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('57', '王宛儿', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('58', '王绿真', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('59', '王盼儿', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('60', '王晓霜', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('61', '王碧凡', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('62', '王夏菡', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('63', '王曼香', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('64', '王若烟', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('65', '王半梦', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('66', '王雅绿', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('67', '王冰蓝', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('68', '王灵槐', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('69', '王平安', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('70', '王书翠', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('71', '王翠风', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('72', '王香巧', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('73', '王代云', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('74', '王梦曼', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('75', '王幼翠', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('76', '王友巧', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('77', '王听寒', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('78', '王梦柏', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('79', '王醉易', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('80', '王访旋', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('81', '王亦玉', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('82', '王凌萱', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('83', '王访卉', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('84', '王怀亦', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('85', '王笑蓝', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('86', '王春翠', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('87', '王靖柏', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('88', '王夜蕾', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('89', '王冰夏', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('90', '王梦松', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('91', '王书雪', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('92', '王乐枫', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('93', '王念薇', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('94', '王靖雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('95', '王寻春', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('96', '王恨山', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('97', '王从寒', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('98', '王忆香', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('99', '王觅波', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('100', '王静曼', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('101', '王凡旋', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('102', '王以亦', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('103', '王念露', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('104', '王芷蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('105', '王千兰', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('106', '王新波', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('107', '王代真', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('108', '王新蕾', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('109', '王雁玉', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('110', '王冷卉', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('111', '王紫山', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('112', '王千琴', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('113', '王恨天', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('114', '王傲芙', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('115', '王盼山', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('116', '王怀蝶', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('117', '王冰兰', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('118', '王山柏', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('119', '王翠萱', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('120', '王恨松', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('121', '王问旋', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('122', '王从南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('123', '王白易', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('124', '王问筠', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('125', '王如霜', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('126', '王半芹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('127', '王丹珍', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('128', '王冰彤', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('129', '王亦寒', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('130', '王寒雁', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('131', '王怜云', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('132', '王寻文', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('133', '王乐丹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('134', '王翠柔', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('135', '王谷山', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('136', '王之瑶', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('137', '王冰露', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('138', '王尔珍', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('139', '王谷雪', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('140', '王乐萱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('141', '王涵菡', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('142', '王海莲', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('143', '王傲蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('144', '王青槐', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('145', '王冬儿', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('146', '王易梦', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('147', '王惜雪', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('148', '王宛海', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('149', '王之柔', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('150', '王夏青', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('151', '王亦瑶', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('152', '王妙菡', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('153', '王春竹', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('154', '王痴梦', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('155', '王紫蓝', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('156', '王晓巧', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('157', '王幻柏', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('158', '王元风', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('159', '王冰枫', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('160', '王访蕊', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('161', '王南春', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('162', '王芷蕊', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('163', '王凡蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('164', '王凡柔', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('165', '王安蕾', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('166', '王天荷', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('167', '王含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('168', '王书兰', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('169', '王雅琴', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('170', '王书瑶', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('171', '王春雁', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('172', '王从安', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('173', '王夏槐', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('174', '王念芹', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('175', '王怀萍', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('176', '王代曼', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('177', '王幻珊', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('178', '王谷丝', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('179', '王秋翠', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('180', '王白晴', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('181', '王海露', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('182', '王代荷', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('183', '王含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('184', '王书蕾', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('185', '王听白', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('186', '王访琴', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('187', '王灵雁', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('188', '王秋春', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('189', '王雪青', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('190', '王乐瑶', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('191', '王含烟', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('192', '王涵双', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('193', '王平蝶', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('194', '王雅蕊', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('195', '王傲之', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('196', '王灵薇', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('197', '王绿春', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('198', '王含蕾', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('199', '王从梦', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('200', '王从蓉', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('201', '王初丹', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('202', '王听兰', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('203', '王听蓉', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('204', '王语芙', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('205', '王夏彤', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('206', '王凌瑶', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('207', '王忆翠', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('208', '王幻灵', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('209', '王怜菡', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('210', '王紫南', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('211', '王依珊', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('212', '王妙竹', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('213', '王访烟', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('214', '王怜蕾', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('215', '王映寒', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('216', '王友绿', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('217', '王冰萍', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('218', '王惜霜', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('219', '王凌香', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('220', '王芷蕾', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('221', '王雁卉', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('222', '王迎梦', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('223', '王元柏', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('224', '王代萱', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('225', '王紫真', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('226', '王千青', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('227', '王凌寒', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('228', '王紫安', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('229', '王寒安', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('230', '王怀蕊', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('231', '王秋荷', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('232', '王涵雁', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('233', '王以山', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('234', '王凡梅', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('235', '王盼曼', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('236', '王翠彤', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('237', '王谷冬', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('238', '王新巧', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('239', '王冷安', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('240', '王千萍', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('241', '王冰烟', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('242', '王雅阳', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('243', '王友绿', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('244', '王南松', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('245', '王诗云', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('246', '王飞风', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('247', '王寄灵', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('248', '王书芹', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('249', '王幼蓉', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('250', '王以蓝', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('251', '王笑寒', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('252', '王忆寒', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('253', '王秋烟', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('254', '王芷巧', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('255', '王水香', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('256', '王映之', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('257', '王醉波', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('258', '王幻莲', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('259', '王夜山', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('260', '王芷卉', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('261', '王向彤', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('262', '王小玉', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('263', '王幼南', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('264', '王凡梦', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('265', '王尔曼', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('266', '王念波', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('267', '王迎松', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('268', '王青寒', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('269', '王笑天', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('270', '王涵蕾', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('271', '王碧菡', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('272', '王映秋', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('273', '王盼烟', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('274', '王忆山', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('275', '王以寒', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('276', '王寒香', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('277', '王小凡', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('278', '王代亦', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('279', '王梦露', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('280', '王映波', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('281', '王友蕊', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('282', '王寄凡', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('283', '王怜蕾', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('284', '王雁枫', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('285', '王水绿', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('286', '王曼荷', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('287', '王笑珊', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('288', '王寒珊', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('289', '王谷南', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('290', '王慕儿', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('291', '王夏岚', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('292', '王友儿', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('293', '王小萱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('294', '王紫青', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('295', '王妙菱', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('296', '王冬寒', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('297', '王曼柔', '23', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('298', '王语蝶', '24', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('299', '王青筠', '25', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('300', '王夜安', '26', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('301', '王觅海', '27', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('302', '王问安', '28', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('303', '王晓槐', '29', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('304', '王雅山', '30', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('305', '王访云', '15', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('306', '王翠容', '16', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('307', '王寒凡', '17', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('308', '王晓绿', '18', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('309', '王以菱', '19', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('310', '王冬云', '20', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('311', '王含玉', '21', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
INSERT INTO `teacher` VALUES ('312', '王访枫', '22', '2022-01-23 20:31:35', '2022-01-23 20:31:35');
SET FOREIGN_KEY_CHECKS=1;
