/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : php_wish

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 31/03/2022 09:51:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rid` int(255) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rid` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 18, '123456', '121', '12121', '1212');
INSERT INTO `comment` VALUES (2, 1, '123456', '1212', '2323', '34534');
INSERT INTO `comment` VALUES (7, 18, '123456', '23232323', '127.0.0.1', '2022-02-04 13:29:56');
INSERT INTO `comment` VALUES (8, 18, '123456', '二二二', '127.0.0.1', '2022-02-04 13:31:41');
INSERT INTO `comment` VALUES (10, 18, '123455', 'wewewe', '127.0.0.1', '2022-02-04 13:32:19');
INSERT INTO `comment` VALUES (26, 18, '123456', '343431', '127.0.0.1', '2022-02-05 23:38:02');
INSERT INTO `comment` VALUES (12, 18, '123455', '3434', '127.0.0.1', '2022-02-04 13:38:25');
INSERT INTO `comment` VALUES (25, 18, '123456', '54545', '127.0.0.1', '2022-02-05 23:36:48');
INSERT INTO `comment` VALUES (17, 18, '123456', 'wewewe', '127.0.0.1', '2022-02-04 16:36:15');
INSERT INTO `comment` VALUES (20, 334, '123456', 'wewe', '127.0.0.1', '2022-02-05 23:13:57');
INSERT INTO `comment` VALUES (21, 18, '123456', 'erer', '127.0.0.1', '2022-02-05 23:19:49');
INSERT INTO `comment` VALUES (22, 18, '123456', '45454', '127.0.0.1', '2022-02-05 23:19:59');
INSERT INTO `comment` VALUES (24, 18, '123456', '3434', '127.0.0.1', '2022-02-05 23:32:22');
INSERT INTO `comment` VALUES (32, 20, '123456', '444', '127.0.0.1', '2022-02-10 11:07:12');
INSERT INTO `comment` VALUES (33, 20, '1234566', '444', '127.0.0.1', '2022-02-10 11:07:58');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, '1', '问问', '1', '1');

-- ----------------------------
-- Table structure for feedback_login
-- ----------------------------
DROP TABLE IF EXISTS `feedback_login`;
CREATE TABLE `feedback_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_login
-- ----------------------------
INSERT INTO `feedback_login` VALUES (1, '123456', '127.0.0.1', '2022-02-08 20:38:52');
INSERT INTO `feedback_login` VALUES (2, '123456', '127.0.0.1', '2022-02-08 21:04:34');
INSERT INTO `feedback_login` VALUES (3, '123456', '127.0.0.1', '2022-02-08 21:48:36');
INSERT INTO `feedback_login` VALUES (4, '123456', '127.0.0.1', '2022-02-08 21:53:08');
INSERT INTO `feedback_login` VALUES (5, '123456', '127.0.0.1', '2022-02-20 17:51:56');
INSERT INTO `feedback_login` VALUES (6, '123456', '127.0.0.1', '2022-02-20 18:08:31');
INSERT INTO `feedback_login` VALUES (7, '123456', '127.0.0.1', '2022-02-20 19:56:55');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rid` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (26, '123455', 11);
INSERT INTO `good` VALUES (27, '123456', 13);
INSERT INTO `good` VALUES (28, '123456', 6);
INSERT INTO `good` VALUES (29, '123456', 5);
INSERT INTO `good` VALUES (30, '123456', 1);
INSERT INTO `good` VALUES (31, '123456', 2);
INSERT INTO `good` VALUES (32, '123456', 16);
INSERT INTO `good` VALUES (33, '123456', 335);
INSERT INTO `good` VALUES (34, '123456', 334);
INSERT INTO `good` VALUES (87, '123456', 18);
INSERT INTO `good` VALUES (53, '123456', 17);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gender',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adopt` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'facebook-icon.png', '123456', '123456', '2022-02-20 19:59:34', '女', '111', '', '', '127.0.0.1', 0);
INSERT INTO `user` VALUES (3, 'images03.jpg', '123455', '123455', '2022-01-24 16:03:40', '女', 'qqqqqqq', '在学校', 'qqq', NULL, 0);
INSERT INTO `user` VALUES (4, '3434', '342', '343', '2022-02-08 16:57:09', '女', '344', '', '', '127.0.0.1', 1);
INSERT INTO `user` VALUES (5, '', '1234566', '1234566', '2022-02-20 20:04:38', '男', '', '', '', '127.0.0.1', 0);

-- ----------------------------
-- Table structure for user_ip
-- ----------------------------
DROP TABLE IF EXISTS `user_ip`;
CREATE TABLE `user_ip`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `time` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ip
-- ----------------------------
INSERT INTO `user_ip` VALUES (1, '2022-01-17 19:02:46', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (2, '2022-01-17 19:04:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (3, '2022-01-17 20:10:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (4, '2022-01-18 12:07:34', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (5, '2022-01-18 13:01:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (6, '2022-01-18 13:02:56', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (7, '2022-01-18 13:45:45', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (8, '2022-01-18 13:46:32', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (9, '2022-01-18 19:00:05', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (10, '2022-01-20 11:40:25', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (11, '2022-01-20 12:30:29', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (12, '2022-01-20 12:30:44', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (13, '2022-01-20 12:31:44', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (14, '2022-01-21 13:29:23', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (15, '2022-01-21 19:07:13', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (16, '2022-01-23 19:49:24', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (17, '2022-01-23 21:52:01', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (18, '2022-01-24 10:28:08', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (19, '2022-01-24 10:29:06', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (20, '2022-01-24 10:30:01', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (21, '2022-01-24 10:36:10', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (22, '2022-01-24 10:49:37', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (23, '2022-01-24 10:56:25', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (24, '2022-01-24 13:40:19', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (25, '2022-01-24 13:42:10', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (26, '2022-01-24 13:42:34', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (27, '2022-01-24 13:43:40', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (28, '2022-01-24 13:45:25', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (29, '2022-01-24 13:52:26', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (30, '2022-01-24 13:54:19', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (31, '2022-01-24 14:06:59', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (32, '2022-01-24 14:14:29', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (33, '2022-01-24 14:24:42', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (34, '2022-01-24 14:33:26', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (35, '2022-01-24 14:33:54', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (36, '2022-01-24 14:42:12', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (37, '2022-01-24 16:03:46', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (38, '2022-01-24 16:06:35', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (39, '2022-01-24 16:09:54', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (40, '2022-01-24 19:54:14', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (41, '2022-01-24 19:54:46', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (42, '2022-01-24 21:06:29', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (43, '2022-01-24 21:15:26', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (44, '2022-01-27 15:25:48', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (45, '2022-01-27 15:49:36', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (46, '2022-02-02 11:41:03', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (47, '2022-02-02 11:51:30', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (48, '2022-02-02 11:51:50', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (49, '2022-02-02 13:00:46', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (50, '2022-02-03 12:44:14', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (51, '2022-02-03 14:03:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (52, '2022-02-03 17:57:44', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (53, '2022-02-04 12:47:42', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (54, '2022-02-04 12:49:06', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (55, '2022-02-04 12:50:19', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (56, '2022-02-04 13:32:12', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (57, '2022-02-04 16:36:09', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (58, '2022-02-05 10:58:52', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (59, '2022-02-05 11:14:09', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (60, '2022-02-05 13:29:21', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (61, '2022-02-05 13:29:44', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (62, '2022-02-07 09:53:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (63, '2022-02-07 10:05:00', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (64, '2022-02-07 10:12:22', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (65, '2022-02-07 10:12:54', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (66, '2022-02-07 10:18:59', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (67, '2022-02-07 10:22:32', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (68, '2022-02-07 10:23:22', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (69, '2022-02-07 10:24:43', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (70, '2022-02-08 17:36:40', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (71, '2022-02-09 13:18:39', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (72, '2022-02-10 10:59:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (73, '2022-02-10 11:07:46', '127.0.0.1', '1234566');
INSERT INTO `user_ip` VALUES (74, '2022-02-10 11:29:15', '127.0.0.1', '1234566');
INSERT INTO `user_ip` VALUES (75, '2022-02-16 15:04:33', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (76, '2022-02-19 15:05:44', '127.0.0.1', '123456');
INSERT INTO `user_ip` VALUES (77, '2022-02-20 16:20:12', '127.0.0.1', '123455');
INSERT INTO `user_ip` VALUES (78, '2022-02-20 16:25:43', '127.0.0.1', '123456');

-- ----------------------------
-- Table structure for wish
-- ----------------------------
DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `imgdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(10) NOT NULL DEFAULT 0,
  `num` int(8) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visit` int(255) NOT NULL,
  `comment` int(255) NOT NULL,
  `show` int(255) NOT NULL,
  `time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wish
-- ----------------------------
INSERT INTO `wish` VALUES (1, 'facebook-icon.png', '123456', '', '海上生明月，天涯共此时。', '#f0ad4e', 'bu.jpg', 3, NULL, '127.0.0.1', 0, 0, 1, '2022-01-17 19:05:36');
INSERT INTO `wish` VALUES (2, 'facebook-icon.png', '123456', '', '世间无限丹青手，一片伤心画不成。', '#f0ad4e', 'bu.jpg', 2, NULL, '127.0.0.1', 4, 0, 1, '2022-01-17 19:07:58');
INSERT INTO `wish` VALUES (3, 'facebook-icon.png', '123456', '', '三十功名尘与土，八千里路云和月.', '#6AF11C', '', 2, NULL, '127.0.0.1', 1, 0, 1, '2022-01-17 19:09:43');
INSERT INTO `wish` VALUES (4, 'facebook-icon.png', '123456', '', '落红不是无情物，化作春泥更护花。\n---------出自龚自珍《己亥杂诗·其五》', '#f0ad4e', 'bu.jpg', 0, NULL, '127.0.0.1', 0, 0, 1, '2022-01-17 19:12:58');
INSERT INTO `wish` VALUES (5, 'facebook-icon.png', '123456', '', '历览前贤国与家，成由勤俭破由奢。\n-----------出自唐代李商隐的《咏史》', '#f0ad4e', 'bu.jpg', 3, NULL, '127.0.0.1', 0, 0, 1, '2022-01-17 19:13:42');
INSERT INTO `wish` VALUES (6, 'facebook-icon.png', '123456', '', '一身报国有万死，双鬓向人无再青。\n-------------出自宋代陆游的《夜泊水村》', '#f0ad4e', 'bu.jpg', 3, NULL, '127.0.0.1', 0, 0, 1, '2022-01-17 19:14:00');
INSERT INTO `wish` VALUES (8, 'facebook-icon.png', '123456', '', '人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。', '#f0ad4e', 'bu.jpg', 0, NULL, '127.0.0.1', 1, 0, 1, '2022-01-17 19:15:13');
INSERT INTO `wish` VALUES (9, 'facebook-icon.png', '123456', '', '无丝竹之乱耳，无案牍之劳形', '#f0ad4e', 'bu.jpg', 1, NULL, '127.0.0.1', 1, 0, 1, '2022-01-17 19:16:07');
INSERT INTO `wish` VALUES (10, 'facebook-icon.png', '123456', '朋友', '海上生明月，天涯共此时。', '#f0ad4e', 'bu.jpg', 2, 5, '127.0.0.1', 0, 0, 1, '2022-01-17 19:16:20');
INSERT INTO `wish` VALUES (11, '', 'cooky123', '', '静以修身,俭以养德,非淡泊无以明志,非宁静无以致远', '#f0ad4e', '', 3, NULL, '127.0.0.1', 2, 0, 1, '2022-01-17 19:16:36');
INSERT INTO `wish` VALUES (12, 'facebook-icon.png', '123456', '', 'aaa', '#f0ad4e', 'bu.jpg', 2, NULL, '127.0.0.1', 2, 0, 1, '2022-01-18 19:00:15');
INSERT INTO `wish` VALUES (13, 'facebook-icon.png', '123456', '朋友', 'bbbb', '#f0ad4e', '', 3, 5, '127.0.0.1', 0, 0, 1, '2022-01-21 14:41:29');
INSERT INTO `wish` VALUES (15, 'facebook-icon.png', '123456', '同学', 'wewe', '#f0ad4e', '', 1, NULL, '127.0.0.1', 6, 0, 1, '2022-01-21 14:47:45');
INSERT INTO `wish` VALUES (16, 'facebook-icon.png', '123456', '亲人', '232323', '#f0ad4e', '', 2, 1, '127.0.0.1', 3, 0, 1, '2022-01-21 15:00:47');
INSERT INTO `wish` VALUES (17, 'facebook-icon.png', '123456', '老师', '5555', '#F04EC5', '', 2, 6, '127.0.0.1', 9, 0, 1, '2022-01-21 15:01:24');
INSERT INTO `wish` VALUES (18, 'facebook-icon.png', '123456', '其他', '请问请问', '#f0ad4e', 'bu.jpg', 2, 2, '127.0.0.1', 21, 11, 1, '2022-02-08 17:37:11');
INSERT INTO `wish` VALUES (20, 'facebook-icon.png', '123456', '其他', '88', '#f0ad4e', '', 1, 0, '127.0.0.1', 28, 2, 1, '2022-02-08 20:46:30');

SET FOREIGN_KEY_CHECKS = 1;
