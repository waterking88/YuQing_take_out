/*
 Navicat MySQL Data Transfer

 Source Server         : first
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : water

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 23/04/2024 15:36:22
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`
(
    `id`            bigint(20) NOT NULL COMMENT '主键',
    `user_id`       bigint(20) NOT NULL COMMENT '用户id',
    `consignee`     varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人',
    `sex`           tinyint(4) NOT NULL COMMENT '性别 0 女 1 男',
    `phone`         varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
    `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级区划编号',
    `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级名称',
    `city_code`     varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级区划编号',
    `city_name`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级名称',
    `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级区划编号',
    `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级名称',
    `detail`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `label`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
    `is_default`    tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
    `create_time`   datetime                                        NOT NULL COMMENT '创建时间',
    `update_time`   datetime                                        NOT NULL COMMENT '更新时间',
    `create_user`   bigint(20) NOT NULL COMMENT '创建人',
    `update_user`   bigint(20) NOT NULL COMMENT '修改人',
    `is_deleted`    int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book`
VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL,
        '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162,
        0);
INSERT INTO `address_book`
VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家',
        0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book`
VALUES (1718956951766945794, 1718885362354442241, 'water', 1, '13652468011', NULL, NULL, NULL, NULL, NULL, NULL, '广金',
        '学校', 0, '2023-10-30 19:44:09', '2023-10-30 20:04:02', 1718885362354442241, 1718885362354442241, 0);
INSERT INTO `address_book`
VALUES (1718961274655637505, 1718885362354442241, 'waterking', 1, '18944770939', NULL, NULL, NULL, NULL, NULL, NULL,
        '广东金融学院保安室', '公司', 1, '2023-10-30 20:01:19', '2023-10-30 20:04:07', 1718885362354442241, 1718885362354442241,
        0);
INSERT INTO `address_book`
VALUES (1721117718083645441, 1, 'water', 1, '13652468011', NULL, NULL, NULL, NULL, NULL, NULL, 'gduf', '学校', 1,
        '2023-11-05 18:50:15', '2023-11-05 18:50:25', 1, 1, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `type`        int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
    `sort`        int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
    `create_time` datetime                                        NOT NULL COMMENT '创建时间',
    `update_time` datetime                                        NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category`
VALUES (1397844263642378242, 1, '湘菜', 2, '2021-05-27 09:16:58', '2023-10-23 16:54:54', 1, 1);
INSERT INTO `category`
VALUES (1397844303408574465, 1, '川菜', 2, '2021-05-27 09:17:07', '2021-06-02 14:27:22', 1, 1);
INSERT INTO `category`
VALUES (1397844391040167938, 1, '粤菜', 3, '2021-05-27 09:17:28', '2021-07-09 14:37:13', 1, 1);
INSERT INTO `category`
VALUES (1413341197421846529, 1, '饮品', 11, '2021-07-09 11:36:15', '2021-07-09 14:39:15', 1, 1);
INSERT INTO `category`
VALUES (1413342269393674242, 2, '商务套餐', 5, '2021-07-09 11:40:30', '2021-07-09 14:43:45', 1, 1);
INSERT INTO `category`
VALUES (1413384954989060097, 1, '主食', 12, '2021-07-09 14:30:07', '2021-07-09 14:39:19', 1, 1);
INSERT INTO `category`
VALUES (1413386191767674881, 2, '儿童套餐', 6, '2021-07-09 14:35:02', '2021-07-09 14:39:05', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '菜品名称',
    `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
    `price`       decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
    `code`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '商品码',
    `image`       varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片',
    `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
    `status`      int(11) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
    `sort`        int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
    `create_time` datetime                                         NOT NULL COMMENT '创建时间',
    `update_time` datetime                                         NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    `is_deleted`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish`
VALUES (1397849739276890114, '辣子鸡', 1397844263642378242, 7800.00, '222222222',
        'e0162f75-37d8-4563-8b64-f401f6dd2931.jpg', '来自鲜嫩美味的小鸡，值得一尝', 0, 0, '2021-05-27 09:38:43',
        '2023-10-25 20:28:43', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397850140982161409, '毛氏红烧肉', 1397844263642378242, 6800.00, '123412341234',
        '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', '毛氏红烧肉毛氏红烧肉，确定不来一份？', 1, 0, '2021-05-27 09:40:19',
        '2023-10-25 20:28:32', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397850392090947585, '组庵鱼翅', 1397844263642378242, 4800.00, '123412341234',
        '042f9b63-6edd-4e35-8514-cab1b09acd12.jpeg', '组庵鱼翅，看图足以表明好吃程度', 1, 0, '2021-05-27 09:41:19',
        '2023-10-25 20:28:16', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397850851245600769, '霸王别姬', 1397844263642378242, 12800.00, '123412341234',
        'a4e83c6a-ac38-4fa1-a483-3c6481c84977.jpg', '还有什么比霸王别姬更美味的呢？', 1, 0, '2021-05-27 09:43:08',
        '2023-10-25 20:28:07', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397851099502260226, '全家福', 1397844263642378242, 11800.00, '23412341234',
        'b16f2f1f-33cf-4237-a330-743ac3af1ea7.jpg', '别光吃肉啦，来份全家福吧，让你长寿又美味', 1, 0, '2021-05-27 09:44:08',
        '2023-10-25 20:27:54', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397851370462687234, '邵阳猪血丸子', 1397844263642378242, 13800.00, '1246812345678',
        'e495bde5-ad46-4b46-86f5-e0957a8c69a5.jpg', '看，美味不？来嘛来嘛，这才是最爱吖', 1, 0, '2021-05-27 09:45:12',
        '2023-10-25 20:27:42', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397851668262465537, '口味蛇', 1397844263642378242, 16800.00, '1234567812345678',
        '0dc18c4b-7bc3-4daa-98de-467c33cb3034.jpg', '爬行界的扛把子，东兴-口味蛇，让你欲罢不能', 1, 0, '2021-05-27 09:46:23',
        '2023-10-25 20:27:26', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397852391150759938, '辣子鸡丁', 1397844303408574465, 8800.00, '2346812468',
        '02878f10-a689-41c3-84d7-64e40533ed9c.jpg', '辣子鸡丁，辣子鸡丁，永远的魂', 1, 0, '2021-05-27 09:49:16',
        '2023-10-25 20:27:15', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397853183287013378, '麻辣兔头', 1397844303408574465, 19800.00, '123456787654321',
        '52d4ec61-d62b-4683-8880-43f681208d03.jpg', '麻辣兔头的详细制作，麻辣鲜香，色泽红润，回味悠长', 1, 0, '2021-05-27 09:52:24',
        '2023-10-25 20:27:05', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397853709101740034, '蒜泥白肉', 1397844303408574465, 9800.00, '1234321234321',
        'f6c15989-bee7-4309-a041-a8398496e4d6.jpg', '多么的有食欲啊', 1, 0, '2021-05-27 09:54:30', '2023-10-25 20:26:55', 1, 1,
        0);
INSERT INTO `dish`
VALUES (1397853890262118402, '鱼香肉丝', 1397844303408574465, 3800.00, '1234212321234',
        'f3f76dea-3583-4f93-89c2-076c1238ad6d.jpg', '鱼香肉丝简直就是我们童年回忆的一道经典菜，上学的时候点个鱼香肉丝盖饭坐在宿舍床上看着肥皂剧，绝了！现在完美复刻一下上学的时候感觉',
        1, 0, '2021-05-27 09:55:13', '2023-10-25 20:26:42', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397854652581064706, '麻辣水煮鱼', 1397844303408574465, 14800.00, '2345312·345321',
        'b569e804-6ab9-4e1a-9bcc-0ee3cad8dbfd.jpg', '鱼片是买的切好的鱼片，放几个虾，增加味道', 1, 0, '2021-05-27 09:58:15',
        '2023-10-25 20:26:22', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397854865672679425, '鱼香炒鸡蛋', 1397844303408574465, 2000.00, '23456431·23456',
        '95e79517-ce3b-4858-a428-cb2648987c77.jpg', '鱼香菜也是川味的特色。里面没有鱼却鱼香味', 1, 0, '2021-05-27 09:59:06',
        '2023-10-25 20:26:06', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397860242057375745, '脆皮烧鹅', 1397844391040167938, 12800.00, '123456786543213456',
        '62eccc28-d68b-4a14-9049-3683ffe8d1d8.jpeg',
        '“广东烤鸭美而香，却胜烧鹅说古冈（今新会），燕瘦环肥各佳妙，君休偏重便宜坊”，可见烧鹅与烧鸭在粤菜之中已早负盛名。作为广州最普遍和最受欢迎的烧烤肉食，以它的“色泽金红，皮脆肉嫩，味香可口”的特色，在省城各大街小巷的烧卤店随处可见。',
        1, 0, '2021-05-27 10:20:27', '2023-10-25 20:25:26', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397860578738352129, '白切鸡', 1397844391040167938, 6600.00, '12345678654',
        '0808476d-5c91-4078-b2d8-5eece72c8530.jpeg',
        '白切鸡是一道色香味俱全的特色传统名肴，又叫白斩鸡，是粤菜系鸡肴中的一种，始于清代的民间。白切鸡通常选用细骨农家鸡与沙姜、蒜茸等食材，慢火煮浸白切鸡皮爽肉滑，清淡鲜美。著名的泮溪酒家白切鸡，曾获商业部优质产品金鼎奖。湛江白切鸡更是驰名粤港澳。粤菜厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的正是白切鸡，深受食家青睐。',
        1, 0, '2021-05-27 10:21:48', '2023-10-25 20:24:59', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397860792492666881, '烤乳猪', 1397844391040167938, 38800.00, '213456432123456',
        '0d33096b-a77b-4ad7-b8eb-8f5d221abca9.jpeg',
        '广式烧乳猪主料是小乳猪，辅料是蒜，调料是五香粉、芝麻酱、八角粉等，本菜品主要通过将食材放入炭火中烧烤而成。烤乳猪是广州最著名的特色菜，并且是“满汉全席”中的主打菜肴之一。烤乳猪也是许多年来广东人祭祖的祭品之一，是家家都少不了的应节之物，用乳猪祭完先人后，亲戚们再聚餐食用。',
        1, 0, '2021-05-27 10:22:39', '2023-10-25 20:24:49', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397860963880316929, '脆皮乳鸽', 1397844391040167938, 10800.00, '1234563212345',
        '99f36315-5237-4c32-9e8d-667c802ad448.jpg',
        '“脆皮乳鸽”是广东菜中的一道传统名菜，属于粤菜系，具有皮脆肉嫩、色泽红亮、鲜香味美的特点，常吃可使身体强健，清肺顺气。随着菜品制作工艺的不断发展，逐渐形成了熟炸法、生炸法和烤制法三种制作方法。无论那种制作方法，都是在鸽子经过一系列的加工，挂脆皮水后再加工而成，正宗的“脆皮乳鸽皮脆肉嫩、色泽红亮、鲜香味美、香气馥郁。这三种方法的制作过程都不算复杂，但想达到理想的效果并不容易。',
        1, 0, '2021-05-27 10:23:19', '2023-10-25 20:24:22', 1, 1, 0);
INSERT INTO `dish`
VALUES (1397862477831122945, '上汤焗龙虾', 1397844391040167938, 108800.00, '1234567865432',
        '1a63918c-dc63-4dbd-a706-8de3dfb95ca0.jpeg',
        '上汤焗龙虾是一道色香味俱全的传统名菜，属于粤菜系。此菜以龙虾为主料，配以高汤制成的一道海鲜美食。本品肉质洁白细嫩，味道鲜美，蛋白质含量高，脂肪含量低，营养丰富。是色香味俱全的传统名菜。', 1, 0,
        '2021-05-27 10:29:20', '2023-10-25 20:19:32', 1, 1, 0);
INSERT INTO `dish`
VALUES (1413342036832100354, '北冰洋', 1413341197421846529, 500.00, '', 'a01b24e1-28cd-433f-8b6e-6e31b2fc864b.png', '', 1,
        0, '2021-07-09 11:39:35', '2023-10-25 20:19:02', 1, 1, 0);
INSERT INTO `dish`
VALUES (1413385247889891330, '米饭', 1413384954989060097, 200.00, '', '474266b6-df50-4380-b865-a00d0c27e28c.jpg', '', 1,
        0, '2021-07-09 14:31:17', '2023-10-25 20:23:44', 1, 1, 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `dish_id`     bigint(20) NOT NULL COMMENT '菜品',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '口味名称',
    `value`       varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
    `create_time` datetime                                        NOT NULL COMMENT '创建时间',
    `update_time` datetime                                        NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    `is_deleted`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor`
VALUES (1397849417888346113, 1397849417854791681, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27',
        '2021-05-27 09:37:27', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397849739297861633, 1397849739276890114, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:28:43',
        '2023-10-25 20:28:43', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397849739323027458, 1397849739276890114, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:28:43',
        '2023-10-25 20:28:43', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397849936421761025, 1397849936404983809, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:39:30',
        '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397849936438538241, 1397849936404983809, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30',
        '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850141015715841, 1397850140982161409, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:28:32',
        '2023-10-25 20:28:32', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850141040881665, 1397850140982161409, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:28:32',
        '2023-10-25 20:28:32', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850392120307713, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:28:16',
        '2023-10-25 20:28:16', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850392137084929, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:28:16',
        '2023-10-25 20:28:16', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850630734262274, 1397850630700707841, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:42:16',
        '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850630755233794, 1397850630700707841, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16',
        '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850851274960898, 1397850851245600769, '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:28:07',
        '2023-10-25 20:28:07', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397850851283349505, 1397850851245600769, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:28:07',
        '2023-10-25 20:28:07', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851099523231745, 1397851099502260226, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:27:54',
        '2023-10-25 20:27:54', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851099527426050, 1397851099502260226, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2023-10-25 20:27:54',
        '2023-10-25 20:27:54', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851370483658754, 1397851370462687234, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-10-25 20:27:42',
        '2023-10-25 20:27:42', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851370483658755, 1397851370462687234, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:27:42',
        '2023-10-25 20:27:42', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851370483658756, 1397851370462687234, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:27:42',
        '2023-10-25 20:27:42', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397851668283437058, 1397851668262465537, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-10-25 20:27:26',
        '2023-10-25 20:27:26', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397852391180120065, 1397852391150759938, '忌口', '[\"不要葱\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:27:15',
        '2023-10-25 20:27:15', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397852391196897281, 1397852391150759938, '辣度', '[\"不辣\",\"微辣\",\"重辣\"]', '2023-10-25 20:27:15',
        '2023-10-25 20:27:15', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397853183307984898, 1397853183287013378, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:27:05',
        '2023-10-25 20:27:05', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397853423486414850, 1397853423461249026, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:53:22',
        '2021-05-27 09:53:22', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397853709126905857, 1397853709101740034, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:26:55',
        '2023-10-25 20:26:55', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397853890283089922, 1397853890262118402, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:26:42',
        '2023-10-25 20:26:42', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397854133632413697, 1397854133603053569, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:56:11',
        '2021-05-27 09:56:11', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397854652623007745, 1397854652581064706, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-10-25 20:26:22',
        '2023-10-25 20:26:22', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397854652635590658, 1397854652581064706, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:26:22',
        '2023-10-25 20:26:22', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397854865735593986, 1397854865672679425, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:26:06',
        '2023-10-25 20:26:06', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397855742303186946, 1397855742273826817, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:02:35',
        '2021-05-27 10:02:35', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397855906497605633, 1397855906468245506, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:03:14',
        '2021-05-27 10:03:14', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397856190573621250, 1397856190540066818, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:04:21',
        '2021-05-27 10:04:21', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397859056709316609, 1397859056684150785, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:15:45',
        '2021-05-27 10:15:45', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397859277837217794, 1397859277812051969, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:16:37',
        '2021-05-27 10:16:37', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397859487502086146, 1397859487476920321, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:17:27',
        '2021-05-27 10:17:27', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397859757061615618, 1397859757036449794, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:18:32',
        '2021-05-27 10:18:32', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397860242086735874, 1397860242057375745, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:25:26',
        '2023-10-25 20:25:26', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397860963918065665, 1397860963880316929, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-10-25 20:24:22',
        '2023-10-25 20:24:22', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397861135754506242, 1397861135733534722, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:24:00',
        '2021-05-27 10:24:00', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397861370035744769, 1397861370010578945, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:24:56',
        '2021-05-27 10:24:56', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397861683459305474, 1397861683434139649, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:26:11',
        '2021-05-27 10:26:11', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397861898467717121, 1397861898438356993, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:27:02',
        '2021-05-27 10:27:02', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397862198054268929, 1397862198033297410, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:28:14',
        '2021-05-27 10:28:14', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1397862477835317250, 1397862477831122945, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2023-10-25 20:19:32',
        '2023-10-25 20:19:32', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398089545865015297, 1398089545676271617, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:31:38',
        '2021-05-28 01:31:38', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398089782323097601, 1398089782285348866, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:32:34',
        '2021-05-28 01:32:34', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398090003262255106, 1398090003228700673, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:33:27',
        '2021-05-28 01:33:27', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398090264554811394, 1398090264517062657, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:34:29',
        '2021-05-28 01:34:29', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398090455399837698, 1398090455324340225, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:35:14',
        '2021-05-28 01:35:14', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398090685449023490, 1398090685419663362, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:36:09',
        '2021-05-28 01:36:09', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398090825358422017, 1398090825329061889, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:36:43',
        '2021-05-28 01:36:43', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398091007051476993, 1398091007017922561, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:37:26',
        '2021-05-28 01:37:26', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398091296164851713, 1398091296131297281, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:38:35',
        '2021-05-28 01:38:35', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398091546531246081, 1398091546480914433, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:39:35',
        '2021-05-28 01:39:35', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398091729809747969, 1398091729788776450, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:18',
        '2021-05-28 01:40:18', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398091889499484161, 1398091889449152513, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:56',
        '2021-05-28 01:40:56', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398092095179763713, 1398092095142014978, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:41:45',
        '2021-05-28 01:41:45', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398092283877306370, 1398092283847946241, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:42:30',
        '2021-05-28 01:42:30', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398094018939236354, 1398094018893099009, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:49:24',
        '2021-05-28 01:49:24', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1398094391494094850, 1398094391456346113, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:50:53',
        '2021-05-28 01:50:53', 1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1399574026165727233, 1399305325713600514, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-06-01 03:50:25',
        '2021-06-01 03:50:25', 1399309715396669441, 1399309715396669441, 0);
INSERT INTO `dish_flavor`
VALUES (1413389684020682754, 1413342036832100354, '温度', '[\"常温\",\"冷藏\"]', '2023-10-25 20:19:02', '2023-10-25 20:19:02',
        1, 1, 0);
INSERT INTO `dish_flavor`
VALUES (1716447062536540162, 1716447062448459777, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-10-24 21:05:17',
        '2023-10-24 21:05:17', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `name`        varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
    `username`    varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
    `password`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
    `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
    `sex`         varchar(2) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '性别',
    `id_number`   varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
    `status`      int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
    `create_time` datetime                                        NOT NULL COMMENT '创建时间',
    `update_time` datetime                                        NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee`
VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1,
        '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee`
VALUES (1716029805767536642, 'waterking', '1067411704', 'e10adc3949ba59abbe56e057f20f883e', '13652468011', '1',
        '441622200302172810', 1, '2023-10-22 17:52:43', '2023-10-27 21:41:55', 1, 1);
INSERT INTO `employee`
VALUES (1716072016068476930, 'kkk8', '15377748698', 'e10adc3949ba59abbe56e057f20f883e', '15377748698', '1',
        '555622248469536821', 1, '2023-10-22 20:40:26', '2023-10-22 20:45:08', 1, 1);
INSERT INTO `employee`
VALUES (1716078542967631874, 'niko2', '18944770939', 'e10adc3949ba59abbe56e057f20f883e', '18944770939', '1',
        '531687744698535555', 1, '2023-10-22 21:07:06', '2023-10-22 21:21:40', 1, 1716029805767536642);
INSERT INTO `employee`
VALUES (1781621983616823298, '少坤', '123456789989', 'e10adc3949ba59abbe56e057f20f883e', '13712795798', '1',
        '456464164646449', 1, '2024-04-20 17:52:36', '2024-04-20 17:52:36', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `name`        varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
    `image`       varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
    `order_id`    bigint(20) NOT NULL COMMENT '订单id',
    `dish_id`     bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
    `setmeal_id`  bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
    `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
    `number`      int(11) NOT NULL DEFAULT 1 COMMENT '数量',
    `amount`      decimal(10, 2) NOT NULL COMMENT '金额',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail`
VALUES (1718906787178029058, '毛氏红烧肉', '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', 1718906787089948674,
        1397850140982161409, NULL, '不要香菜,重辣', 2, 68.00);
INSERT INTO `order_detail`
VALUES (1718906787178029059, '组庵鱼翅', '042f9b63-6edd-4e35-8514-cab1b09acd12.jpeg', 1718906787089948674,
        1397850392090947585, NULL, '微辣,微辣', 1, 48.00);
INSERT INTO `order_detail`
VALUES (1718906915376930818, '套餐A', 'ba2e947f-859b-4f22-991c-5d277bdfc837.jpg', 1718906915376930817, NULL,
        1716835364917743617, NULL, 1, 50.00);
INSERT INTO `order_detail`
VALUES (1718939589894221826, '套餐A', 'ba2e947f-859b-4f22-991c-5d277bdfc837.jpg', 1718939589831307266, NULL,
        1716835364917743617, NULL, 1, 50.00);
INSERT INTO `order_detail`
VALUES (1718956628495159299, '邵阳猪血丸子', 'e495bde5-ad46-4b46-86f5-e0957a8c69a5.jpg', 1718956628495159298,
        1397851370462687234, NULL, '少冰,不要香菜,重辣', 1, 138.00);
INSERT INTO `order_detail`
VALUES (1718961787379941379, '毛氏红烧肉', '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', 1718961787379941378,
        1397850140982161409, NULL, '不要香菜,重辣', 1, 68.00);
INSERT INTO `order_detail`
VALUES (1718962015252283395, '毛氏红烧肉', '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', 1718962015252283394,
        1397850140982161409, NULL, '不要香菜,重辣', 1, 68.00);
INSERT INTO `order_detail`
VALUES (1718963398558908418, '毛氏红烧肉', '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', 1718963398558908417,
        1397850140982161409, NULL, '不要香菜,重辣', 1, 68.00);
INSERT INTO `order_detail`
VALUES (1721118653639843842, '毛氏红烧肉', '1d006172-86dd-418d-8693-d00c87d56d1f.jpg', 1721118653627260930,
        1397850140982161409, NULL, '不要香菜,重辣', 1, 68.00);
INSERT INTO `order_detail`
VALUES (1781284626904391682, '全家福', 'b16f2f1f-33cf-4237-a330-743ac3af1ea7.jpg', 1781284626875031553,
        1397851099502260226, NULL, '不要蒜,微辣', 1, 118.00);
INSERT INTO `order_detail`
VALUES (1781622788201771011, '白切鸡', '0808476d-5c91-4078-b2d8-5eece72c8530.jpeg', 1781622788201771010,
        1397860578738352129, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail`
VALUES (1781622788201771012, '脆皮乳鸽', '99f36315-5237-4c32-9e8d-667c802ad448.jpg', 1781622788201771010,
        1397860963880316929, NULL, '重辣', 1, 108.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `id`              bigint(20) NOT NULL COMMENT '主键',
    `number`          varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
    `status`          int(11) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
    `user_id`         bigint(20) NOT NULL COMMENT '下单用户',
    `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
    `order_time`      datetime       NOT NULL COMMENT '下单时间',
    `checkout_time`   datetime       NOT NULL COMMENT '结账时间',
    `pay_method`      int(11) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
    `amount`          decimal(10, 2) NOT NULL COMMENT '实收金额',
    `remark`          varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
    `phone`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `address`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `user_name`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `consignee`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders`
VALUES (1718906787089948674, '1718906787089948674', 4, 1718885362354442241, 1718886406933270530, '2023-10-30 16:24:48',
        '2023-10-30 16:24:48', 1, 184.00, '', '13652468011', '广东金融学院', NULL, 'water');
INSERT INTO `orders`
VALUES (1718906915376930817, '1718906915376930817', 3, 1718885362354442241, 1718886406933270530, '2023-10-30 16:25:19',
        '2023-10-30 16:25:19', 1, 50.00, '', '13652468011', '广东金融学院', NULL, 'water');
INSERT INTO `orders`
VALUES (1718939589831307266, '1718939589831307266', 3, 1718885362354442241, 1718886406933270530, '2023-10-30 18:35:09',
        '2023-10-30 18:35:09', 1, 50.00, '', '13652468011', '广东金融学院', NULL, 'water');
INSERT INTO `orders`
VALUES (1718956628495159298, '1718956628495159298', 2, 1718885362354442241, 1718886406933270530, '2023-10-30 19:42:52',
        '2023-10-30 19:42:52', 1, 138.00, '', '13652468011', '广东金融学院', NULL, 'water');
INSERT INTO `orders`
VALUES (1718961787379941378, '1718961787379941378', 2, 1718885362354442241, 1718961274655637505, '2023-10-30 20:03:22',
        '2023-10-30 20:03:22', 1, 68.00, '', '18944770939', '广东金融学院保安室', NULL, 'waterking');
INSERT INTO `orders`
VALUES (1718962015252283394, '1718962015252283394', 2, 1718885362354442241, 1718961274655637505, '2023-10-30 20:04:16',
        '2023-10-30 20:04:16', 1, 68.00, '', '18944770939', '广东金融学院保安室', NULL, 'waterking');
INSERT INTO `orders`
VALUES (1718963398558908417, '1718963398558908417', 2, 1718885362354442241, 1718961274655637505, '2023-10-30 20:09:46',
        '2023-10-30 20:09:46', 1, 68.00, '好吃吗？', '18944770939', '广东金融学院保安室', 'water', 'waterking');
INSERT INTO `orders`
VALUES (1721118653627260930, '1721118653627260930', 2, 1, 1721117718083645441, '2023-11-05 18:53:59',
        '2023-11-05 18:53:59', 1, 68.00, '', '13652468011', 'gduf', NULL, 'water');
INSERT INTO `orders`
VALUES (1781284626875031553, '1781284626875031553', 2, 1, 1721117718083645441, '2024-04-19 19:32:04',
        '2024-04-19 19:32:04', 1, 118.00, '4', '13652468011', 'gduf', NULL, 'water');
INSERT INTO `orders`
VALUES (1781622788201771010, '1781622788201771010', 2, 1, 1721117718083645441, '2024-04-20 17:55:48',
        '2024-04-20 17:55:48', 1, 174.00, '骚坤骚坤', '13652468011', 'gduf', NULL, 'water');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
    `price`       decimal(10, 2)                                  NOT NULL COMMENT '套餐价格',
    `status`      int(11) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
    `code`        varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
    `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
    `image`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
    `create_time` datetime                                        NOT NULL COMMENT '创建时间',
    `update_time` datetime                                        NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    `is_deleted`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal`
VALUES (1716835364917743617, 1413342269393674242, '套餐A', 5000.00, 1, '', '无',
        'ba2e947f-859b-4f22-991c-5d277bdfc837.jpg', '2023-10-24 23:13:43', '2023-10-25 20:30:26', 1, 1, 0);
INSERT INTO `setmeal`
VALUES (1716864662277992449, 1413342269393674242, '1', 10000.00, 1, '', '1', '0fed1509-9b64-4343-a84f-c977959dda41.jpg',
        '2023-10-25 01:10:08', '2023-10-25 20:30:08', 1, 1, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `setmeal_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
    `dish_id`     varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品id',
    `name`        varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
    `price`       decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
    `copies`      int(11) NOT NULL COMMENT '份数',
    `sort`        int(11) NOT NULL DEFAULT 0 COMMENT '排序',
    `create_time` datetime                                        NOT NULL COMMENT '创建时间',
    `update_time` datetime                                        NOT NULL COMMENT '更新时间',
    `create_user` bigint(20) NOT NULL COMMENT '创建人',
    `update_user` bigint(20) NOT NULL COMMENT '修改人',
    `is_deleted`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish`
VALUES (1717156586746564610, '1716864662277992449', '1397851668262465537', '口味蛇', 16800.00, 1, 0, '2023-10-25 20:30:08',
        '2023-10-25 20:30:08', 1, 1, 0);
INSERT INTO `setmeal_dish`
VALUES (1717156662193704961, '1716835364917743617', '1397851668262465537', '口味蛇', 16800.00, 1, 0, '2023-10-25 20:30:26',
        '2023-10-25 20:30:26', 1, 1, 0);
INSERT INTO `setmeal_dish`
VALUES (1717156662193704962, '1716835364917743617', '1413385247889891330', '米饭', 200.00, 1, 0, '2023-10-25 20:30:26',
        '2023-10-25 20:30:26', 1, 1, 0);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `name`        varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
    `image`       varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
    `user_id`     bigint(20) NOT NULL COMMENT '主键',
    `dish_id`     bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
    `setmeal_id`  bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
    `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
    `number`      int(11) NOT NULL DEFAULT 1 COMMENT '数量',
    `amount`      decimal(10, 2) NOT NULL COMMENT '金额',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart`
VALUES (1781623880838934530, '白切鸡', '0808476d-5c91-4078-b2d8-5eece72c8530.jpeg', 1, 1397860578738352129, NULL, NULL, 1,
        66.00, '2024-04-20 18:00:09');
INSERT INTO `shopping_cart`
VALUES (1781623886044065793, '烤乳猪', '0d33096b-a77b-4ad7-b8eb-8f5d221abca9.jpeg', 1, 1397860792492666881, NULL, NULL, 1,
        388.00, '2024-04-20 18:00:10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`        bigint(20) NOT NULL COMMENT '主键',
    `name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
    `phone`     varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
    `sex`       varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
    `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
    `avatar`    varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
    `status`    int(11) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (1718885362354442241, 'water', '13652468011', NULL, NULL, NULL, 1);
INSERT INTO `user`
VALUES (1781284472545615874, NULL, '19868606948', NULL, NULL, NULL, 1);

SET
FOREIGN_KEY_CHECKS = 1;
