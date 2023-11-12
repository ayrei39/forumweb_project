/*
 Navicat Premium Data Transfer

 Source Server         : forum
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 12/11/2023 16:40:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(20000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `kind` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `modifytime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (2, 1, '56ys5LqM56-H5biW5a2Q5pu05paw5qCH6aKY', '56ys5LqM56-H5biW5a2Q5pu05paw5YaF5a65', 'find', '2023-11-14 08:32:15', '2023-11-14 08:54:58');
INSERT INTO `article` VALUES (3, 1, '56ys5LiJ56-H5biW5a2Q', '56ys5LiJ56-H5biW5a2Q55qE5YaF5a65', 'general', '2023-11-14 08:57:07', '2023-11-14 08:57:07');
INSERT INTO `article` VALUES (6, 1, '56ys5YWt56-H5paH56ug', '56ys5YWt56-H5paH56ug55qE5YaF5a65', 'ask', '2023-11-14 17:20:56', '2023-11-14 17:20:56');
INSERT INTO `article` VALUES (9, 1, '5aaC5L2V6Ziy5q2iIEFuZHJvaWQg5bqU55So6KKr5LqM5qyh5omT5YyF77yf', '5Lul5LiL5piv5LiA5Lqb5bi455So55qE5pa55rOV77yaCgoxLuS9v-eUqOS7o-eggea3t-a3huW3peWFt--8mgrku6PnoIHmt7fmt4blj6_ku6Xkvb_lj43nvJbor5HlkI7nmoTku6PnoIHpmr7ku6XpmIXor7vlkoznkIbop6PvvIzku47ogIzlop7liqDkuozmrKHmiZPljIXnmoTpmr7luqbjgIIKCuWcqCBBbmRyb2lkIOW8gOWPkeS4re-8jOW4uOeUqOeahOS7o-eggea3t-a3huW3peWFt-aYryBQcm9HdWFyZOOAguS4i-mdouaYr-WcqCBBbmRyb2lkIFN0dWRpbyDkuK3phY3nva4gUHJvR3VhcmQg55qE55u45YWz5Luj56CB77yaCgoxKSDlnKggYXBwIOeahCBidWlsZC5ncmFkbGUg5paH5Lu25Lit77yM5re75Yqg5Lul5LiL5Luj56CB77yaCgpgYGAKYW5kcm9pZCB7IC8vIOecgeeVpeWFtuS7lumFjee9riBidWlsZFR5cGVzIHsgcmVsZWFzZSB7IG1pbmlmeUVuYWJsZWQgdHJ1ZSBwcm9ndWFyZEZpbGVzIGdldERlZmF1bHRQcm9ndWFyZEZpbGUoJ3Byb2d1YXJkLWFuZHJvaWQtb3B0aW1pemUudHh0JyksICdwcm9ndWFyZC1ydWxlcy5wcm8nIH0gfSB9CmBgYAoKMikg5Zyo6aG555uu5qC555uu5b2V5LiL5Yib5bu6IHByb2d1YXJkLXJ1bGVzLnBybyDmlofku7bvvIznlKjkuo7mjIflrprmt7fmt4bop4TliJnjgILku6XkuIvmmK_kuIDkupvluLjnlKjnmoTop4TliJnvvJoKCmBgYAoj5Z-65pys6KeE5YiZIC1vcHRpbWl6YXRpb25wYXNzZXMgNSAjIOS8mOWMluasoeaVsCAtZG9udHVzZW1peGVkY2FzZWNsYXNzbmFtZXMgIyDkuI3kvb_nlKjmt7flkIjlpKflsI_lhpnnmoTnsbvlkI0gLWRvbnRza2lwbm9ucHVibGljbGlicmFyeWNsYXNzZXMgIyDkuI3ot7Pov4fpnZ7lhazlhbHlupPnmoTnsbsgLWRvbnRwcmV2ZXJpZnkgIyDkuI3pooTpqozor4EgXCAj5Luj56CB5re35reG6KeE5YiZIC1rZWVwIGNsYXNzIGNvbS5leGFtcGxlLioqIHsqO30gIyDkv53nlZkgY29tLmV4YW1wbGUg5YyF5Y-K5YW25a2Q5YyF5Lit55qE5omA5pyJ57G7IC1rZWVwY2xhc3NtZW1iZXJzIGNsYXNzIGNvbS5leGFtcGxlLioqIHsqO30gIyDkv53nlZkgY29tLmV4YW1wbGUg5YyF5Y-K5YW25a2Q5YyF5Lit55qE5omA5pyJ57G75oiQ5ZGYIC1kb250d2FybiBjb20uZXhhbXBsZS4qKiAjIOS4jeitpuWRiiBjb20uZXhhbXBsZSDljIXlj4rlhbblrZDljIXkuK3nmoTnsbsgI-WFtuS7luinhOWImSAta2VlcGF0dHJpYnV0ZXMgU2lnbmF0dXJlIC1rZWVwYXR0cmlidXRlcyAqQW5ub3RhdGlvbiog5Lul5LiK5Luj56CB5Y-q5piv5LiA5Liq566A5Y2V56S65L6L77yM5a6e6ZmF55qE5re35reG6KeE5YiZ6ZyA6KaB5qC55o2u5YW35L2T55qE5bqU55So6L-b6KGM6LCD5pW05ZKM5LyY5YyW44CC5a6M5oiQ5Lul5LiK5q2l6aqk5ZCO77yM5Zyo6L-b6KGMIHJlbGVhc2Ug54mI5pys5omT5YyF5pe277yMUHJvR3VhcmQg5Lya6Ieq5Yqo5a-55Luj56CB6L-b6KGM5re35reG5ZKM5LyY5YyW77yM5LuO6ICM5aKe5Yqg5bqU55So55qE5a6J5YWo5oCn44CC', 'find', '2023-11-14 21:04:42', '2023-11-14 21:04:42');
INSERT INTO `article` VALUES (11, 2, '55So5oi35LqM5Y-R6YCB55qE56ys5LqM56-H5paH56ug', '55So5oi35LqM5Y-R6YCB55qE56ys5LqM56-H5paH56ug55qE5YaF5a65', 'general', '2023-11-15 00:26:16', '2023-11-15 00:26:16');
INSERT INTO `article` VALUES (12, 2, '55So5oi35LqM5Y-R6YCB55qE56ys5LiJ56-H5paH56ug77yI5Y-R546w77yJ', '55So5oi35LqM5Y-R6YCB55qE56ys5LiJ56-H5paH56ug55qE5YaF5a6577yI5Y-R546w77yJ', 'find', '2023-11-15 00:27:03', '2023-11-15 00:27:03');
INSERT INTO `article` VALUES (13, 1, '55So5oi3MeesrOS4gOasoeWcqOWJjeerr-WwneivlXBvc3Q', '55So5oi3MeesrOS4gOasoeWcqOWJjeerr-WwneivlXBvc3TnmoTlhoXlrrk', 'general', '2023-11-16 00:49:25', '2023-11-16 00:49:25');
INSERT INTO `article` VALUES (14, 1, '55So5oi3MeesrOS6jOasoeWcqOWJjeerr-WwneivlXBvc3Q', '55So5oi3MeesrOS6jOasoeWcqOWJjeerr-WwneivlXBvc3TnmoTlhoXlrrk', 'find', '2023-11-16 00:56:21', '2023-11-16 00:56:21');
INSERT INTO `article` VALUES (15, 1, '55So5oi3MeesrOS4ieasoeWcqOWJjeerr-WwneivlXBvc3TvvIhibG9n77yJ', '55So5oi3MeesrOS4ieasoeWcqOWJjeerr-WwneivlXBvc3TvvIhibG9n77yJ55qE5YaF5a65', 'blog', '2023-11-16 01:03:48', '2023-11-16 01:03:48');
INSERT INTO `article` VALUES (16, 1, '55So5oi3MeesrOS4ieasoeWcqOWJjeerr-WwneivlXBvc3TvvIhjcmVhdGXvvIk', '55So5oi3MeesrOS4ieasoeWcqOWJjeerr-WwneivlXBvc3TvvIhjcmVhdGXvvInnmoTlhoXlrrk', 'create', '2023-11-16 01:07:55', '2023-11-16 01:07:55');
INSERT INTO `article` VALUES (17, 2, '55So5oi3MuesrOS4gOasoeWcqOWJjeerr-WwneivlXBvc3TvvIhldmVudHPvvIk', '55So5oi3MuesrOS4gOasoeWcqOWJjeerr-WwneivlXBvc3TvvIhldmVudHPvvIkK5YaF5a65CuWGheWuuQ', 'events', '2023-11-16 01:11:39', '2023-11-16 01:11:39');
INSERT INTO `article` VALUES (18, 2, '55So5oi3MuesrOS6jOasoeWcqOWJjeerr-WwneivlXBvc3TvvIhmdXR1cmXvvIk', '55So5oi3MuesrOS4gOasoeWcqOWJjeerr-WwneivlXBvc3TvvIhmdXR1cmXvvIkK5Y2H5a2mCuWNh-WtpgrljYflraYK5Y2H5a2m', 'future', '2023-11-16 01:12:24', '2023-11-16 01:12:24');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 1, 9, 'Mi7liqDlm7pBUEvvvJoK5Y-v5Lul5L2_55So5LiA5Lqb5Yqg5Zu65bel5YW35a-5QVBL6L-b6KGM5Yqg5a-G77yM5L2_5b6X5oG25oSP5pS75Ye76ICF6Zq-5Lul55u05o6l6I635Y-W5YiwQVBL5YyF77yM5LuO6ICM5YeP5bCR5LqM5qyh5omT5YyF55qE6aOO6Zmp44CCCgrlnKggQW5kcm9pZCDlvIDlj5HkuK3vvIzluLjnlKjnmoTliqDlm7rlt6XlhbfmnIkgRGV4UHJvdGVjdG9yIOWSjCBCYW5nY2xlIOetie-8jOi_meS6m-W3peWFt-aPkOS-m-S6huWRveS7pOihjOWSjCBHcmFkbGUg5o-S5Lu25Lik56eN5pa55byP6L-b6KGM5Yqg5Zu644CC5LiL6Z2i5piv5L2_55SoIERleFByb3RlY3RvciBHcmFkbGUg5o-S5Lu26L-b6KGM5Yqg5Zu655qE55u45YWz5Luj56CB77yaCgox77yJIOWcqCBhcHAg55qEIGJ1aWxkLmdyYWRsZSDmlofku7bkuK3vvIzmt7vliqDku6XkuIvku6PnoIHvvJoKCmBidWlsZHNjcmlwdCB7IHJlcG9zaXRvcmllcyB7IG1hdmVuIHsgdXJsICdodHRwczovL29zcy5zb25hdHlwZS5vcmcvY29udGVudC9yZXBvc2l0b3JpZXMvc25hcHNob3RzLycgfSB9IGRlcGVuZGVuY2llcyB7IGNsYXNzcGF0aCAnY29tLmFuZHJvaWQudG9vbHMuYnVpbGQ6Z3JhZGxlOjMuNS4zJyBjbGFzc3BhdGggJ2NvbS5hbmRyb2lkLnRvb2xzLmJ1aWxkOmdyYWRsZTozLjUuMycgY2xhc3NwYXRoICdjb20uamVwcHNzb246Z3JhZGxlLWRleHByb3RlY3RvcjoyLjEuMS1TTkFQU0hPVCcgfSB9IGFwcGx5IHBsdWdpbjogJ2RleHByb3RlY3RvcicgZGV4UHJvdGVjdG9yIHsgdGFyZ2V0ICdhbGwnIHByb2R1Y3RGbGF2b3JzIHsgZGVtbyB7IGVuYWJsZSB0cnVlIGFjdGl2YXRpb25VcmwgJ2h0dHBzOi8vd3d3LmRleHByb3RlY3Rvci5jb20vYWN0aXZhdGlvbicgYWN0aXZhdGlvbktleSAnMTIzNDU2Nzg5MCcgbGlicmFyeVBhdGggJ2xpYnMvZGV4cHJvdGVjdG9yLmphcicgY29uZmlndXJhdGlvbkZpbGUgJ2RleHByb3RlY3Rvci54bWwnIH0gfSByZWxlYXNlIHsgZW5hYmxlIHRydWUgYWN0aXZhdGlvblVybCAnaHR0cHM6Ly93d3cuZGV4cHJvdGVjdG9yLmNvbS9hY3RpdmF0aW9uJyBhY3RpdmF0aW9uS2V5ICcxMjM0NTY3ODkwJyBsaWJyYXJ5UGF0aCAnbGlicy9kZXhwcm90ZWN0b3IuamFyJyBjb25maWd1cmF0aW9uRmlsZSAnZGV4cHJvdGVjdG9yLnhtbCcgfSB9YAoy77yJ5Zyo6aG555uu5qC555uu5b2V5LiL5Yib5bu6IGRleHByb3RlY3Rvci54bWwg5paH5Lu277yM55So5LqO5oyH5a6a5Yqg5Zu66YWN572u44CC5Lul5LiL5piv5LiA5Lqb5bi455So55qE6YWN572u77yaCgpgYGAKPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4gPHJlc291cmNlcyB4bWxuczp0b29scz0iaHR0cDovL3NjaGVtYXMuYW5kcm9pZC5jb20vdG9vbHMiIHRvb2xzOmtlZXA9IkBkcmF3YWJsZS9pY29uIiB0b29sczprZWVwQ2xhc3Nlc1dpdGhNZW1iZXJzPSJ0cnVlIj4gPCEtLSDkv53nlZnmjIflrprnsbvlkoznsbvmiJDlkZjkuI3ooqvmt7fmt4YgLS0-IDxrZWVwPiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlBY3Rpdml0eSIvPiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlGcmFnbWVudCIvPiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlTZXJ2aWNlIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeVJlY2VpdmVyIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUFwcGxpY2F0aW9uIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUNsYXNzIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUludGVyZmFjZSIvPiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlFbnVtIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUFubm90YXRpb24iLz4gPG1ldGhvZCBuYW1lPSJvbkNyZWF0ZSIgY2xhc3M9ImNvbS5leGFtcGxlLk15QWN0aXZpdHkiLz4gPG1ldGhvZCBuYW1lPSJvbkNyZWF0ZVZpZXciIGNsYXNzPSJjb20uZXhhbXBsZS5NeUZyYWdtZW50Ii8-IDxtZXRob2QgbmFtZT0ib25TdGFydENvbW1hbmQiIGNsYXNzPSJjb20uZXhhbXBsZS5NeVNlcnZpY2UiLz4gPG1ldGhvZCBuYW1lPSJvblJlY2VpdmUiIGNsYXNzPSJjb20uZXhhbXBsZS5NeVJlY2VpdmVyIi8-IDxtZXRob2QgbmFtZT0ib25DcmVhdGUiIGNsYXNzPSJjb20uZXhhbXBsZS5NeUFwcGxpY2F0aW9uIi8-IDxmaWVsZCBuYW1lPSJteUZpZWxkIiBjbGFzcz0iY29tLmV4YW1wbGUuTXlDbGFzcyIvPiA8bWV0aG9kIG5hbWU9Im15TWV0aG9kIiBjbGFzcz0iY29tLmV4YW1wbGUuTXlJbnRlcmZhY2UiLz4gPGZpZWxkIG5hbWU9Im15RW51bSIgY2xhc3M9ImNvbS5leGFtcGxlLk15RW51bSIvPiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlBbm5vdGF0aW9uIi8-IDwva2VlcD4gPCEtLSDph43lkb3lkI3mjIflrprnsbvlkoznsbvmiJDlkZggLS0-IDxyZW5hbWU-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUNsYXNzIiB0bz0iY29tLmV4YW1wbGUuUmVuYW1lZENsYXNzIi8-IDxtZXRob2QgbmFtZT0ibXlNZXRob2QiIGNsYXNzPSJjb20uZXhhbXBsZS5NeUludGVyZmFjZSIgdG89InJlbmFtZWRNZXRob2QiLz4gPGZpZWxkIG5hbWU9Im15RmllbGQiIGNsYXNzPSJjb20uZXhhbXBsZS5NeUNsYXNzIiB0bz0icmVuYW1lZEZpZWxkIi8-IDxjbGFzcyBuYW1lPSJjb20uZXhhbXBsZS5NeUFubm90YXRpb24iIHRvPSJSZW5hbWVkQW5ub3RhdGlvbiIvPiA8L3JlbmFtZT4gPCEtLSDliqDlr4bmjIflrprnsbvlkozotYTmupAgLS0-IDxlbmNyeXB0PiA8Y2xhc3MgbmFtZT0iY29tLmV4YW1wbGUuTXlDbGFzcwpgYGAKCg', '2023-11-15 08:35:00');
INSERT INTO `reply` VALUES (2, 1, 9, 'My7lr7lBUEvov5vooYzmlbDlrZfnrb7lkI3vvJoK5pWw5a2X562-5ZCN5Y-v5Lul56Gu5L-dQVBL55qE5a6M5pW05oCn5ZKM55yf5a6e5oCn77yM5Y-v5Lul5L2_5pS75Ye76ICF5peg5rOV5Zyo5LiN5pS55Y-YQVBL562-5ZCN55qE5oOF5Ya15LiL6L-b6KGM5LqM5qyh5omT5YyF44CCCgrlnKggQW5kcm9pZCBTdHVkaW8g5Lit77yM5Y-v5Lul5L2_55So5Lul5LiL5q2l6aqk5a-5IEFQSyDov5vooYzmlbDlrZfnrb7lkI3vvJoKCjHvvInlnKjpobnnm67moLnnm67lvZXkuIvliJvlu7rkuIDkuKoga2V5c3RvcmUg5paH5Lu277yM55So5LqO5a2Y5YKo5pWw5a2X6K-B5Lmm5ZKM56eB6ZKl44CC5Y-v5Lul5L2_55SoIGtleXRvb2wg5bel5YW355Sf5oiQ5LiA5Liq5paw55qEIGtleXN0b3Jl77yM5ZG95Luk5aaC5LiL77yaCgpgYGAKa2V5dG9vbCAtZ2Vua2V5IC12IC1rZXlzdG9yZSBteS1yZWxlYXNlLWtleS5rZXlzdG9yZSAtYWxpYXMgbXlfYWxpYXMgLWtleWFsZyBSU0EgLWtleXNpemUgMjA0OCAtdmFsaWRpdHkgMTAwMDAKYGBgCuWFtuS4re-8jG15LXJlbGVhc2Uta2V5LmtleXN0b3JlIOaYryBrZXlzdG9yZSDmlofku7blkI3vvIxteV9hbGlhcyDmmK_mlbDlrZfor4HkuabliKvlkI3vvIxSU0Eg5piv5L2_55So55qE5Yqg5a-G566X5rOV77yMMjA0OCDmmK_lr4bpkqXlpKflsI_vvIx2YWxpZGl0eSDmmK_or4HkuabmnInmlYjmnJ_jgIIKCjLvvInlnKjpobnnm67nmoQgYnVpbGQuZ3JhZGxlIOaWh-S7tuS4rea3u-WKoOS7peS4i-S7o-egge-8mgoKYGBgCmFuZHJvaWQgeyAuLi4gc2lnbmluZ0NvbmZpZ3MgeyByZWxlYXNlIHsgc3RvcmVGaWxlIGZpbGUoIm15LXJlbGVhc2Uta2V5LmtleXN0b3JlIikgc3RvcmVQYXNzd29yZCAicGFzc3dvcmQiIGtleUFsaWFzICJteV9hbGlhcyIga2V5UGFzc3dvcmQgInBhc3N3b3JkIiB9IH0gYnVpbGRUeXBlcyB7IHJlbGVhc2UgeyAuLi4gc2lnbmluZ0NvbmZpZyBzaWduaW5nQ29uZmlncy5yZWxlYXNlIH0gfSAuLi4gfQpgYGAK5YW25Lit77yMc3RvcmVGaWxlIOaMh-WumiBrZXlzdG9yZSDmlofku7bot6_lvoTvvIxzdG9yZVBhc3N3b3JkIOWSjCBrZXlQYXNzd29yZCDmmK8ga2V5c3RvcmUg5a-G56CB5ZKM5pWw5a2X6K-B5Lmm5a-G56CB77yMa2V5QWxpYXMg5piv5pWw5a2X6K-B5Lmm5Yir5ZCN44CCCgoz77yJ5ZyoIEFuZHJvaWQgU3R1ZGlvIOS4re-8jOS9v-eUqCBCdWlsZCAtPiBHZW5lcmF0ZSBTaWduZWQgQnVuZGxlL0FQSyDoj5zljZXpobnpgInmi6nopoHnrb7lkI3nmoQgQVBL77yM6YCJ5oupIHJlbGVhc2UgYnVpbGQgdHlwZe-8jOi-k-WFpSBrZXlzdG9yZSDlkozmlbDlrZfor4Hkuablr4bnoIHvvIzljbPlj6_lr7kgQVBLIOi_m-ihjOaVsOWtl-etvuWQjeOAggoK', '2023-11-15 08:36:25');
INSERT INTO `reply` VALUES (3, 1, 9, 'NC7mo4DmtYvlupTnlKjov5DooYznjq_looPvvJoK5bqU55So5Y-v5Lul5qOA5rWL5b2T5YmN6L-Q6KGM55qE546v5aKD5piv5ZCm5Li655yf5a6e6K6-5aSH77yM5aaC5p6c5qOA5rWL5Yiw6L-Q6KGM546v5aKD5LiN5piv55yf5a6e6K6-5aSH77yM5YiZ5bqU55So5Y-v5Lul6Ieq5Yqo5YWz6Zet77yM5Lul6YG_5YWN6KKr5LqM5qyh5omT5YyF44CCCgropoHmo4DmtYvlupTnlKjnmoTov5DooYznjq_looPvvIzlj6_ku6Xkvb_nlKggQW5kcm9pZCDmj5DkvpvnmoQgQnVpbGQg57G744CC5Lul5LiL5piv5LiA5Lqb5bi455So55qE5pa55rOV77yaCgox77yJ5qOA5rWL6K6-5aSH55qEIENQVSDmnrbmnoTvvJoKCmBgYAppZiAoQnVpbGQuVkVSU0lPTi5TREtfSU5UID49IEJ1aWxkLlZFUlNJT05fQ09ERVMuTE9MTElQT1ApIHsgZm9yIChTdHJpbmcgYWJpIDogQnVpbGQuU1VQUE9SVEVEX0FCSVMpIHsgTG9nLmkoIk15QXBwIiwgIlN1cHBvcnRlZCBBQkk6ICIgKyBhYmkpOyB9IH0gZWxzZSB7IExvZy5pKCJNeUFwcCIsICJBQkk6ICIgKyBCdWlsZC5DUFVfQUJJKTsgfQpgYGAKMu-8ieajgOa1i-iuvuWkh-eahOWxj-W5leWIhui-qOeOh--8mgoKYGBgCkRpc3BsYXlNZXRyaWNzIG1ldHJpY3MgPSBnZXRSZXNvdXJjZXMoKS5nZXREaXNwbGF5TWV0cmljcygpOyBpbnQgc2NyZWVuV2lkdGggPSBtZXRyaWNzLndpZHRoUGl4ZWxzOyBpbnQgc2NyZWVuSGVpZ2h0ID0gbWV0cmljcy5oZWlnaHRQaXhlbHM7CmBgYAoz77yJ5qOA5rWL6K6-5aSH55qE5pON5L2c57O757uf54mI5pys77yaCgpgYGAKaW50IHNka1ZlcnNpb24gPSBCdWlsZC5WRVJTSU9OLlNES19JTlQ7IFN0cmluZyBvc1ZlcnNpb24gPSBCdWlsZC5WRVJTSU9OLlJFTEVBU0U7CmBgYAo077yJ5qOA5rWL6K6-5aSH55qE5ZOB54mM5ZKM5Z6L5Y-377yaCgpgYGAKU3RyaW5nIGJyYW5kID0gQnVpbGQuQlJBTkQ7IFN0cmluZyBtb2RlbCA9IEJ1aWxkLk1PREVMOwpgYGAKNe-8ieajgOa1i-W6lOeUqOeahOWMheWQjeWSjOeJiOacrOWPt--8mgoKYGBgClN0cmluZyBwYWNrYWdlTmFtZSA9IGdldFBhY2thZ2VOYW1lKCk7IFBhY2thZ2VNYW5hZ2VyIHBhY2thZ2VNYW5hZ2VyID0gZ2V0UGFja2FnZU1hbmFnZXIoKTsgdHJ5IHsgUGFja2FnZUluZm8gcGFja2FnZUluZm8gPSBwYWNrYWdlTWFuYWdlci5nZXRQYWNrYWdlSW5mbyhwYWNrYWdlTmFtZSwgMCk7IFN0cmluZyB2ZXJzaW9uTmFtZSA9IHBhY2thZ2VJbmZvLnZlcnNpb25OYW1lOyBpbnQgdmVyc2lvbkNvZGUgPSBwYWNrYWdlSW5mby52ZXJzaW9uQ29kZTsgfSBjYXRjaCAoUGFja2FnZU1hbmFnZXIuTmFtZU5vdEZvdW5kRXhjZXB0aW9uIGUpIHsgZS5wcmludFN0YWNrVHJhY2UoKTsgfQpgYGAK5rOo5oSP77yM5p-Q5Lqb6K6-5aSH5Y-v6IO95a2Y5Zyo5a6a5Yi25YyWIFJPTe-8jOS-i-WmguWwj-exs-OAgeWNjuS4uuetie-8jOi_meS6m-iuvuWkh-eahOezu-e7n-WxnuaAp-WPr-iDveS4juagh-WHhiBBbmRyb2lkIOiuvuWkh-S4jeWQjO-8jOmcgOimgei_m-ihjOmineWklueahOWkhOeQhuOAggoK', '2023-11-15 08:37:47');
INSERT INTO `reply` VALUES (4, 1, 9, 'NS7lnKjlupTnlKjkuK3pm4bmiJDlj43osIPor5XmioDmnK_vvJoK5Y-v5Lul5Zyo5bqU55So5Lit5re75Yqg5LiA5Lqb5Y-N6LCD6K-V5Luj56CB77yM5Lul5L2_5pS75Ye76ICF5peg5rOV6YCa6L-H6LCD6K-V5bel5YW36I635Y-W5bqU55So55qE5Luj56CB5ZKM6LWE5rqQ44CCCgrlnKggQW5kcm9pZCDlupTnlKjkuK3pm4bmiJDlj43osIPor5XmioDmnK_vvIzlj6_ku6XlnKjku6PnoIHkuK3mo4DmtYvmmK_lkKblpITkuo7osIPor5XnirbmgIHvvIzlpoLmnpzmmK_vvIzliJnph4flj5bnm7jlupTnmoTmjqrmlr3vvIzkvovlpoLpgIDlh7rlupTnlKjmiJbogIXlvLrliLblhbPpl63osIPor5XlmajjgILku6XkuIvmmK_kuIDnp43luLjnlKjnmoTlj43osIPor5XmioDmnK_lrp7njrDmlrnms5XvvJoKCmBgYApwdWJsaWMgY2xhc3MgRGVidWdEZXRlY3RvciB7IHB1YmxpYyBzdGF0aWMgYm9vbGVhbiBpc0RlYnVnZ2luZygpIHsgcmV0dXJuIERlYnVnLmlzRGVidWdnZXJDb25uZWN0ZWQoKSB8fCBEZWJ1Zy53YWl0aW5nRm9yRGVidWdnZXIoKTsgfSBwdWJsaWMgc3RhdGljIHZvaWQgZGV0ZWN0RGVidWdnaW5nKCkgeyBpZiAoaXNEZWJ1Z2dpbmcoKSkgeyBMb2cuZSgiRGVidWdEZXRlY3RvciIsICJEZWJ1Z2dpbmcgZGV0ZWN0ZWQsIGV4aXRpbmcuLi4iKTsgU3lzdGVtLmV4aXQoMCk7IH0gfSB9CmBgYArlnKjlupTnlKjkuK3pnIDopoHkvb_nlKjlj43osIPor5XmioDmnK_ml7bvvIzlj6_ku6XosIPnlKggRGVidWdEZXRlY3Rvci5kZXRlY3REZWJ1Z2dpbmcoKSDmlrnms5Xov5vooYzmo4DmtYvjgILlpoLmnpzmo4DmtYvliLDmraPlnKjov5vooYzosIPor5XvvIzliJnkvJrovpPlh7rplJnor6_ml6Xlv5flubbpgIDlh7rlupTnlKjjgIIKCumcgOimgeazqOaEj-eahOaYr--8jOS4gOS6m-iwg-ivleWZqOWPr-iDveS8muWxj-iUveiwg-ivleajgOa1i--8jOWboOatpOatpOenjeWPjeiwg-ivleaKgOacr-W5tuS4jeiDveWujOWFqOS_neivgeW6lOeUqOS4jeiiq-iwg-ivleOAggoK5Lul5LiK44CC', '2023-11-15 08:38:36');
INSERT INTO `reply` VALUES (5, 1, 11, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMeeahOWbnuWkje-8iDHvvIk', '2023-11-15 08:40:28');
INSERT INTO `reply` VALUES (6, 1, 11, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMeeahOWbnuWkje-8iDLvvIk', '2023-11-15 08:40:42');
INSERT INTO `reply` VALUES (7, 1, 11, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMeeahOWbnuWkje-8iDPvvIk', '2023-11-15 08:40:54');
INSERT INTO `reply` VALUES (9, 1, 12, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMueahOWbnuWkje-8iDLvvIk', '2023-11-15 08:41:33');
INSERT INTO `reply` VALUES (10, 1, 12, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMueahOWbnuWkje-8iDPvvIk', '2023-11-15 08:41:43');
INSERT INTO `reply` VALUES (11, 1, 12, '55So5oi3MeWvueeUqOaItzLnmoTmlofnq6AxMueahOWbnuWkje-8iDTvvIk', '2023-11-15 08:41:54');
INSERT INTO `reply` VALUES (12, 1, 18, '55So5oi35LiACuWbnuWkjQrlm57lpI0K5Zue5aSNCuWbnuWkjQrlm57lpI0', '2023-11-16 01:28:08');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `photo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '$2a$10$5nANLXWUGy37dYYEpfDzXeD.AOeZPmZqvr2KlYtQzKWjmQMCZufhK', 'https://bocchi.rocks/assets/img/page/special/present_69/download/ep1/ico_ep1_01.png');
INSERT INTO `user` VALUES (2, '223', '$2a$10$g.jG2YUGYqjDCJu7Z2uxBe3dFV4Al35kVvT472TppwvxDlYKg59dq', 'https://bocchi.rocks/assets/img/page/special/present_69/download/ep1/ico_ep1_02.png');
INSERT INTO `user` VALUES (11, '222', '$2a$10$lCx73SM9icC9bRv2kI7pneLeoy9elz6OyKHX5/COXTtneHe/p9vQq', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (13, '444', '$2a$10$LAzNO4DTpKjFlR2wUhVSt.mDU.P3UokfHujTDnmOhmQEWrTvBElxu', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (14, '66', '$2a$10$rzTxIX1NoOx3X6wkyWmQ5O1VrReSZK8PQvPHWzKOhX2vor5XWcUTS', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (15, '12', '$2a$10$Rj.I/fDqJVg2d.ymAPYPOOmZR4wsgFjrxx8mwRsrVaboDXgvMbE4O', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (16, '13', '$2a$10$PbfufBQkfxykTVC8bzClnOpWQrkbrZkNKVLiOfp16TiUgPmPcUFaC', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (17, '333', '$2a$10$vs7DK5wtkJ3.L7nS87kdx.3esiiJBF3/EObI5i/x93XNFdT2gX9cC', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (18, '3', '$2a$10$Z4g1rM6lngRJJcwxdxbiwOZwPI7gTYY/cfdxjiy1Drd2.BRT134XO', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');
INSERT INTO `user` VALUES (19, '4', '$2a$10$IBtCCakchA31pgbdFhrolugiXnWheAqHrIhzwCXgBIapw25Roc392', 'https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png');

SET FOREIGN_KEY_CHECKS = 1;
