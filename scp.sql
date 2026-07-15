/*
 Navicat Premium Dump SQL

 Source Server         : scp
 Source Server Type    : MySQL
 Source Server Version : 90701 (9.7.1)
 Source Host           : localhost:3306
 Source Schema         : scp

 Target Server Type    : MySQL
 Target Server Version : 90701 (9.7.1)
 File Encoding         : 65001

 Date: 12/07/2026 16:54:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for user
-- ----------------------------

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id，主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `status` tinyint NULL DEFAULT 1 COMMENT '用户状态：0是封禁状态，1是正常状态',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像，保存图片存储路径',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `authority` tinyint NULL DEFAULT 0 COMMENT '0是普通用户，1是管理员',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户账号创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '普通用户表' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` (`id`, `name`, `status`, `image`, `phone`, `email`, `authority`, `password`, `create_time`) VALUES
(1, '张明', 1, NULL, '13800001111', 'zhangming@scu.edu.cn', 0, '123456', '2026-07-01 09:00:00'),
(2, '李雪', 1, NULL, '13800002222', 'lixue@scu.edu.cn', 0, '123456', '2026-07-02 10:30:00'),
(3, '王浩', 1, NULL, '13800003333', 'wanghao@scu.edu.cn', 0, '123456', '2026-07-03 14:20:00'),
(4, '刘婷', 1, NULL, '13800004444', 'liuting@scu.edu.cn', 0, '123456', '2026-07-04 08:15:00'),
(5, '陈晨', 1, NULL, '13800005555', 'chenchen@scu.edu.cn', 0, '123456', '2026-07-05 16:40:00'),
(6, '赵琳', 1, NULL, '13800006666', 'zhaolin@scu.edu.cn', 0, '123456', '2026-07-06 11:10:00'),
(7, '周杰', 1, NULL, '13800007777', 'zhoujie@scu.edu.cn', 0, '123456', '2026-07-07 09:30:00'),
(8, '孙艺', 1, NULL, '13800008888', 'sunyi@scu.edu.cn', 0, '123456', '2026-07-08 13:50:00'),
(9, '吴昊', 1, NULL, '13800009999', 'wuhao@scu.edu.cn', 0, '123456', '2026-07-09 15:00:00'),
(10, 'admin', 1, NULL, NULL, NULL, 1, '123456', '2026-07-01 00:00:00');





-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子id，主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '发帖人',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子标题',
  `body_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '帖子正文文本',
  `body_image` json NULL COMMENT '帖子正文图片，保存图片存储路径数组',
  `tag` json NULL,
  `likes` int NULL DEFAULT 0 COMMENT '点赞数',
  `comments` int NULL DEFAULT 0 COMMENT '评论数',
  `priority` int NULL DEFAULT 0 COMMENT '帖子排序优先级，优先级越高排在越前',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '帖子创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '帖子修改时间，用户编辑已发布的帖子的时间',
  `interact_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '帖子最后一次被评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
-- 帖子数据（中文标签，支持多标签）
INSERT INTO `blog` (`id`, `user_id`, `title`, `body_text`, `body_image`, `tag`, `likes`, `comments`, `priority`, `create_time`, `update_time`, `interact_time`) VALUES
(1, 1, '江安校区图书馆期末开放时间调整通知', '江安校区图书馆期末周（7月1日-7月15日）开放时间调整为7:00-23:00，请大家合理安排复习时间，馆内禁止占座。', NULL, '["校园", "学习"]', 15, 3, 0, '2026-07-14 10:00:00', NULL, NULL),

(2, 2, '2026年国家奖学金申请条件和流程', '请问今年国家奖学金的申请时间和条件是什么？我是大二计算机专业学生，成绩专业前8%，有省级竞赛奖项，有资格申请吗？求学长学姐解答！', NULL, '["求助", "学习"]', 8, 6, 0, '2026-07-14 08:30:00', NULL, NULL),

(3, 3, '望江校区北园食堂涨价了，大家怎么看？', '北园食堂这个学期一荤一素从8块涨到12块，分量还变少了。南园食堂价格相对稳定，推荐大家去南园吃。有没有其他省钱吃饭攻略？', NULL, '["生活", "美食"]', 25, 8, 0, '2026-07-14 12:00:00', NULL, NULL),

(4, 4, '校园跑APP定位失败解决方案', '用的"步道乐跑"最近经常GPS信号弱，跑完2公里不记录。已试过重启手机、重装APP、开启高精度定位都不行。有没有遇到同样问题的同学？', NULL, '["科技", "求助", "体育"]', 5, 3, 0, '2026-07-14 17:20:00', NULL, NULL),

(5, 5, '江安商业街新开的书咖推荐', '江安商业街新开了一家"书咖"，环境超好，有插座、WiFi快、咖啡也不贵，美式15块拿铁18块。还有独立自习区，期末复习好去处！', NULL, '["生活", "校园"]', 30, 8, 0, '2026-07-14 09:00:00', NULL, NULL),

(6, 6, '大三计科选课求助：哪些选修课值得选？', '马上要选课了，计科大三有哪些值得选的选修课？求推荐给分高、能学到东西的课程。想避开点名频繁或作业量过大的课。', NULL, '["学习", "求助"]', 6, 4, 0, '2026-07-14 14:30:00', NULL, NULL),

(7, 7, '2026年暑假放假及开学安排', '根据学校校历：暑假从7月15日开始，8月30日结束。8月31日报到注册，9月1日正式上课。大家提前买票规划行程！', NULL, '["校园"]', 15, 2, 0, '2026-07-14 07:00:00', NULL, NULL),

(8, 8, '校园网晚上卡顿严重，求解决', '每天晚上8-11点校园网慢得连网页都打不开，更别说看网课视频了。说是100M宽带，实际体验不如手机4G。希望学校能升级设备！', NULL, '["科技", "求助"]', 18, 7, 0, '2026-07-14 20:00:00', NULL, NULL),

(9, 9, '江安游泳馆开放时间及收费标准', '江安游泳馆夏季开放：上午9:00-11:30，下午14:00-20:00。校内学生凭学生证10元/次，校外人员30元/次。需自备泳具和锁具。', NULL, '["体育", "校园"]', 4, 1, 0, '2026-07-14 16:00:00', NULL, NULL),

(10, 1, '校园周边好吃的外卖推荐', '食堂吃腻了想换口味，求推荐学校周边性价比高、卫生干净的外卖店。最好能送到江安校区东门，求学长学姐推荐！', NULL, '["美食", "求助", "生活"]', 9, 5, 0, '2026-07-14 11:30:00', NULL, NULL),

(11, 2, '计算机专业找暑期实习经验分享', '分享一下我拿到腾讯暑期实习offer的经验：简历要突出项目经历，算法题刷了200道，面试时多展示思考过程。大家有问题可以问我！', NULL, '["求职", "科技"]', 22, 10, 0, '2026-07-14 09:00:00', NULL, NULL),

(12, 3, '出闲置：二手电动车转让', '毕业出闲置，爱玛电动车骑了两年，电池续航还有25公里左右。价格600元，可小刀。江安校区看车，有意私聊！', NULL, '["闲置", "生活"]', 7, 4, 0, '2026-07-14 14:00:00', NULL, NULL),

(13, 4, '四川大学校园篮球赛决赛回顾', '昨天校园篮球赛决赛太精彩了！计算机学院VS商学院，最后计算机学院以78:75险胜。MVP是计算机学院的张明，全场砍下35分！', NULL, '["体育", "校园"]', 20, 6, 0, '2026-07-14 10:00:00', NULL, NULL),

(14, 5, '推荐几部适合暑假看的电影', '推荐几部适合暑假看的经典电影：《肖申克的救赎》《阿甘正传》《盗梦空间》《星际穿越》。都是IMDb高分电影，值得二刷！', NULL, '["娱乐"]', 11, 3, 0, '2026-07-14 19:00:00', NULL, NULL),

(15, 6, '分手后怎么走出来？求建议', '和在一起两年的女朋友分手了，感觉很难受。有没有过来人分享一下怎么走出失恋？或者有什么推荐的电影、书籍可以治愈？', NULL, '["情感", "求助"]', 16, 9, 0, '2026-07-14 22:00:00', NULL, NULL),

(16, 7, '暑期社会实践招募队友', '暑假想去凉山做支教社会实践，现在缺2个队友。要求：有耐心、能吃苦、会拍照写文案更好。有意向的私聊我！', NULL, '["校园", "求助"]', 3, 2, 0, '2026-07-14 08:00:00', NULL, NULL),

(17, 8, '食堂新出的麻辣香锅测评', '食堂二楼新出了麻辣香锅，微辣/中辣/特辣可选，价格18-25元/份。今天试了中辣，味道还不错，比外面便宜，推荐大家试试！', NULL, '["美食", "生活"]', 14, 4, 0, '2026-07-14 12:00:00', NULL, NULL),

(18, 9, '有没有一起组队参加数学建模的？', '2026年全国大学生数学建模竞赛9月报名，寻2名队友。最好是计科/数学/统计专业，有编程基础或建模经验。一起拿奖！', NULL, '["学习", "求助"]', 4, 2, 0, '2026-07-14 20:00:00', NULL, NULL),

(19, 1, '毕业季：最舍不得川大的三个地方', '快毕业了，最舍不得的三个地方：图书馆的靠窗座位、商业街的奶茶店、操场上的星空。在川大四年，这里承载了太多回忆。', NULL, '["情感", "校园"]', 28, 12, 0, '2026-07-14 21:00:00', NULL, NULL),

(20, 2, '校园二手教材交易群推荐', '毕业季有很多学长学姐在出二手教材，价格便宜（5-20元/本）。推荐加这个QQ群：123456789，进群备注"买书"。', NULL, '["闲置", "学习"]', 6, 2, 0, '2026-07-14 15:00:00', NULL, NULL);
INSERT INTO `blog` (`id`, `user_id`, `title`, `body_text`, `body_image`, `tag`, `likes`, `comments`, `priority`, `create_time`, `update_time`, `interact_time`) VALUES 
(21, 1, '社恐鼠鼠被拼尽全力，还是温柔大姐姐拿下了', '鼠鼠是个大一新生,平时最爱的事情就是上课、吃饭、然后打游戏。这大半年鼠鼠都是这么过来的，期间也想找对象，但因为建模一般，有点小胖，除了身高真的没啥优势，再加上鼠鼠特别社恐，基本就和恋爱无缘了。\n\n没想到一切到了上个月有了转机，有人在表白墙上发帖，想找一个个子高高的、壮或者有点胖的对象。鼠鼠的舍友就想着整蛊一下我，就在帖子下@了鼠鼠，鼠鼠也没在意，毕竟之前也有过，从来没人加过鼠鼠。\n\n结果第二天一个好友申请弹了出来，鼠鼠当时在上高数课，说实话有点震惊。不过鼠鼠也不是特别在意，因为觉得人家没有理由喜欢鼠鼠。后面就有一搭没一搭地聊天，说实话鼠鼠真心动了，姐姐长得很漂亮，身材也超级顶，还是鼠鼠最喜欢的姐姐类型的。虽然她比鼠鼠小，但鼠鼠还是喜欢叫她姐姐。\n\n但鼠鼠的自卑告诉鼠鼠她并不属于鼠鼠，再加上鼠鼠完全不会聊天，就在以为姐姐会放弃鼠鼠的时候，前天姐姐突然想鼠鼠出来散步。那时候鼠鼠真的特别忐忑，一是觉得这是否是鼠鼠此生仅有的机会，二是怕姐姐在见到鼠鼠本人后会选择扭头就走。最后还是鼓起勇气答应了。\n\n第二天，鼠鼠早早就开始鼓捣自己，洗了个彻彻底底的澡（平时鼠鼠虽然天天洗澡，但都很草率），还破天荒地吹了头发，选了鼠鼠认为最好看的衣服，还买了奶茶，然后就毅然决然出发了。\n\n过程出奇地顺利，姐姐貌似对鼠鼠很满意。鼠鼠不太会聊天，姐姐一直在引导鼠鼠，然后不知不觉到了操场。从外面到操场要走一条那种碎石上面铺了几块石板的路，但是姐姐穿的是高跟鞋，走起来非常不方便，姐姐竟然直接就牵起了鼠鼠的手。\n\n鼠鼠哪里见过这阵仗啊，人一下就僵住了，还好是晚上，不然姐姐就看出来鼠鼠脸已经红透了。说起来有点不好意思，鼠鼠当时其实有点起立了。走到操场上姐姐也没有放手的意思，就这样拉着鼠鼠的手绕操场走了两圈。\n\n然后姐姐又拉着鼠鼠去了一个偏僻的、风景很好的地方，和鼠鼠聊了很久的天，互相了解后鼠鼠更喜欢姐姐了。后面门禁时间快到了，鼠鼠才依依不舍地送姐姐到宿舍门口，然后临走前姐姐还给鼠鼠一个大大的拥抱。姐姐这样香香软软的小蛋糕抱在怀里，真的香晕了。\n\n然后鼠鼠问姐姐我们这现在这算什么关系，姐姐似笑非笑地说"那就看小同学怎么想的喽"，说完姐姐就上楼了。鼠鼠再傻也知道姐姐在暗示我，毕竟表白这种事还是男生来做比较好嘛。\n\n于是鼠鼠就邀请姐姐第二天去海底捞吃饭，姐姐答应了。鼠鼠准备了鲜花，那天晚上鼠鼠几乎没怎么睡，鼠鼠还完全没有反应过来。第二天如约而至，姐姐依然打扮得很漂亮，事情完全按照鼠鼠所期待的那样——吃饭、送花、姐姐同意、然后官宣。当时鼠鼠朋友全在鼠鼠朋友圈下面扣问号哈哈哈。\n\n吃完饭，鼠鼠提出去看电影，姐姐也欣然同意。电影过程中姐姐全程拉着鼠鼠的手，还靠着鼠鼠，鼠鼠在旁边真的快被香晕了。电影结束，因为晚上有晚自习，鼠鼠只能被迫回学校和姐姐分别了嘤嘤嘤。\n\n然后就发生了鼠鼠此生难忘的事情——姐姐让鼠鼠头低下来一点（因为鼠鼠很高），鼠鼠还没反应过来，姐姐就在鼠鼠的唇上啄了一口，然后姐姐就走了，留鼠鼠愣在原地。姐姐的唇真的好软，鼠鼠嘴唇上还留下了姐姐涂的唇彩，尝了一下，甜的。\n\n回到宿舍后，鼠鼠久久不能平静，于是就有了这篇文章。平时都是在情投一盒上看别人秀恩爱，鼠鼠可羡慕了，没想到有一天真的会轮到鼠鼠哈哈哈，鼠鼠现在真的好幸福。\n\n写这篇文章也是为了告诉盒友们要自信一点，万一有人就喜欢你这款呢。祝盒友们也能早日找到自己的真爱！', NULL, '["情感", "生活"]', 0, 0, 0, '2026-07-14 23:30:00', NULL, NULL);


-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论id，主键',
  `blog_id` bigint NOT NULL COMMENT '帖子id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父评论id，0代表属于该帖子，其余数字代表属于该数字id对应的评论',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `likes` int NULL DEFAULT 0 COMMENT '点赞数',
  `sub_comments` int NULL DEFAULT 0 COMMENT '子评论数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_blog_id`(`blog_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
-- 评论数据
INSERT INTO `comment` (`id`, `blog_id`, `parent_id`, `user_id`, `text`, `likes`, `sub_comments`, `create_time`) VALUES
(1, 2, 0, 1, '我也想问这个问题！同大二，蹲一个回答', 3, 0, '2026-07-02 08:45:00'),
(2, 2, 0, 5, '国家奖学金一般在9月中下旬开始申请，要求成绩专业前10%且无挂科记录，你可以先准备材料', 5, 1, '2026-07-02 09:00:00'),
(3, 2, 2, 2, '谢谢学长！那请问需要准备哪些具体材料呢？', 1, 0, '2026-07-02 09:15:00'),
(4, 2, 0, 8, '建议你直接去辅导员办公室问一下，每年政策可能有点调整', 2, 0, '2026-07-03 10:00:00'),
(5, 3, 0, 6, '北园食堂确实涨价了，推荐你去南园食堂，价格还比较良心', 8, 0, '2026-07-03 12:30:00'),
(6, 3, 0, 7, '建议去商业街吃，虽然贵点但是分量足，或者自己带饭', 3, 0, '2026-07-03 13:00:00'),
(7, 3, 0, 1, '我已经从食堂转战外卖了，凑个拼单还能省点钱', 4, 0, '2026-07-04 08:00:00'),
(8, 1, 0, 3, '期末周延长到23:00真的太赞了！不然图书馆关门太早都没地方复习', 6, 0, '2026-07-05 15:30:00'),
(9, 5, 0, 2, '这家店咖啡确实不错，而且晚上营业到22:00，很适合刷夜', 10, 0, '2026-07-05 10:00:00'),
(10, 5, 0, 4, 'mark一下，这周末去打卡！', 2, 0, '2026-07-05 14:00:00'),
(11, 8, 0, 9, '可以用手机热点，虽然流量贵但至少能稳定用', 1, 0, '2026-07-08 20:30:00'),
(12, 8, 0, 2, '已经向信息中心反馈了，他们说要升级设备，希望能快点解决', 3, 0, '2026-07-09 10:00:00');

-- ========================================
-- 更新帖子互动数据（comments 和 interact_time）
-- ========================================

-- 帖子1（id=1）：新增1条评论，interact_time 更新为最后一条评论时间
UPDATE `blog` SET `comments` = `comments` + 1, `interact_time` = '2026-07-14 15:30:00' WHERE `id` = 1;

-- 帖子2（id=2）：新增4条评论（含1条子评论），interact_time 更新为最后一条评论时间
UPDATE `blog` SET `comments` = `comments` + 4, `interact_time` = '2026-07-14 10:00:00' WHERE `id` = 2;

-- 帖子3（id=3）：新增3条评论，interact_time 更新为最后一条评论时间
UPDATE `blog` SET `comments` = `comments` + 3, `interact_time` = '2026-07-14 14:00:00' WHERE `id` = 3;

-- 帖子5（id=5）：新增2条评论，interact_time 更新为最后一条评论时间
UPDATE `blog` SET `comments` = `comments` + 2, `interact_time` = '2026-07-14 14:00:00' WHERE `id` = 5;

-- 帖子8（id=8）：新增2条评论，interact_time 更新为最后一条评论时间
UPDATE `blog` SET `comments` = `comments` + 2, `interact_time` = '2026-07-14 21:00:00' WHERE `id` = 8;

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞记录项id，主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `target_type` tinyint NOT NULL COMMENT '点赞对象类型，0代表给帖子点赞，1代表给评论点赞',
  `target_id` bigint NOT NULL COMMENT '对象id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_target`(`user_id` ASC, `target_type` ASC, `target_id` ASC) USING BTREE,
  INDEX `idx_target`(`target_type` ASC, `target_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like
-- ----------------------------
-- 点赞数据
INSERT INTO `like` (`id`, `user_id`, `target_type`, `target_id`, `create_time`) VALUES
(1, 1, 0, 5, '2026-07-05 09:30:00'),
(2, 2, 0, 5, '2026-07-05 10:00:00'),
(3, 3, 0, 5, '2026-07-05 11:00:00'),
(4, 4, 0, 3, '2026-07-03 12:15:00'),
(5, 5, 0, 3, '2026-07-03 12:30:00'),
(6, 6, 0, 3, '2026-07-03 13:00:00'),
(7, 7, 0, 1, '2026-07-05 15:35:00'),
(8, 8, 0, 8, '2026-07-08 20:10:00'),
(9, 9, 0, 8, '2026-07-08 20:20:00'),
(10, 2, 0, 2, '2026-07-06 10:00:00'),
(11, 1, 1, 9, '2026-07-05 10:10:00'),
(12, 3, 1, 5, '2026-07-03 12:40:00'),
(13, 4, 1, 5, '2026-07-03 12:50:00'),
(14, 5, 1, 2, '2026-07-02 09:10:00');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT NULL COMMENT '0是举报用户，1是举报帖子，2是举报评论',
  `target_id` bigint NULL DEFAULT NULL COMMENT '举报对象id',
  `reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `done` tinyint NULL DEFAULT NULL COMMENT '0是未处理，1是已处理',
  `admin_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '举报提交时间',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '举报处理时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `report_pk`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sensitive_word_pk`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sensitive_word
-- ----------------------------
INSERT INTO `sensitive_word` VALUES (12, '习近平', '2026-07-12 15:38:25');
INSERT INTO `sensitive_word` VALUES (13, '毛泽东', '2026-07-12 15:39:45');
INSERT INTO `sensitive_word` VALUES (14, '习近平2', '2026-07-12 15:47:20');
INSERT INTO `sensitive_word` VALUES (15, '习近平', '2026-07-12 15:59:02');
INSERT INTO `sensitive_word` VALUES (16, '习近平', '2026-07-12 16:09:45');
INSERT INTO `sensitive_word` VALUES (17, '习近平', '2026-07-12 16:09:51');
INSERT INTO `sensitive_word` VALUES (18, '习近平', '2026-07-12 16:12:08');



-- ----------------------------
-- Table structure for user_ban
-- ----------------------------
DROP TABLE IF EXISTS `user_ban`;
CREATE TABLE `user_ban`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `admin_id` bigint NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_ban_pk_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ban
-- ----------------------------
INSERT INTO `user_ban` VALUES (2, 1, 1, '严重违规', '2026-07-12 15:41:03', '2026-07-12 16:11:03');

-- ----------------------------
-- Table structure for user_mute
-- ----------------------------
DROP TABLE IF EXISTS `user_mute`;
CREATE TABLE `user_mute`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `admin_id` bigint NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_mute_pk_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户禁言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_mute
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
