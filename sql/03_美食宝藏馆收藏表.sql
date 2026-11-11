-- ============================================================
-- Crafts-Island 手艺岛
-- 第 15 模块：美食宝藏馆（宝藏饭馆收藏 · 探店打卡）
-- 功能场景：朋友推荐 / 路上偶遇的好馆子，先收藏下来，有空去打卡
-- 学习点：巩固第02课（建表、约束、CRUD），为第03课查询进阶打基础
-- 表前缀：food_（符合架构文档 §6 插件表命名规范）
-- ============================================================

-- ------------------------------------------------------------
-- 第一步：确认数据库存在（和 01 课保持一致，重复执行不报错）
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS crafts_island
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE crafts_island;

-- ------------------------------------------------------------
-- 第二步：创建宝藏馆收藏表 food_restaurant
-- ------------------------------------------------------------
-- 字段设计思路（每一列都回答一个问题）：
--   user_id         这馆子是哪个用户收藏的？（符合架构 §6.3，用户相关表都带外键）
--   name            馆子叫什么？(店名)
--   cuisine         什么菜系？(川菜/湘菜/粤菜/日料……)
--   address         在哪？(街道/商圈，方便以后找过去)
--   signature_dish  招牌菜是啥？(进店必点的)
--   price_per_person 人均多少钱？(衡量性价比)
--   rating          我的评分 1~5 (星)
--   tags            打几个标签，以后好找（夜宵、适合聚餐、宝藏小店……）
--   is_fit_diet     是否适合减脂期吃？(贴合减脂场景，0-不适合/1-适合)
--   status          打卡状态：想去 / 已去 / 常去
--   review          点评 / 推荐理由（为什么值得收藏）
--   image_url       门面或招牌菜照片链接（可选）
--   create_time     什么时候收藏的
--   update_time     最近一次修改（评分/状态变了就更新，架构 §6.1 通用字段）
CREATE TABLE IF NOT EXISTS food_restaurant (
    id               INT PRIMARY KEY AUTO_INCREMENT COMMENT '馆子ID，主键，自增',
    user_id          INT NOT NULL COMMENT '所属用户ID，外键关联user表',
    name             VARCHAR(100) NOT NULL COMMENT '馆子名称（店名）',
    cuisine          VARCHAR(30)  DEFAULT '' COMMENT '菜系，如：川菜/湘菜/粤菜/日料',
    address          VARCHAR(255) DEFAULT '' COMMENT '位置/地址，方便找过去',
    signature_dish   VARCHAR(100) DEFAULT '' COMMENT '招牌菜，进店必点',
    price_per_person DECIMAL(6,2) DEFAULT 0 COMMENT '人均消费（元），衡量性价比',
    rating           DECIMAL(2,1) DEFAULT 0 COMMENT '我的评分 1~5 星，如 4.5',
    tags             VARCHAR(200) DEFAULT '' COMMENT '标签，逗号分隔，如：夜宵,适合聚餐,宝藏小店',
    is_fit_diet      TINYINT(1)   DEFAULT 0 COMMENT '是否适合减脂期吃：0-不适合 1-适合',
    status           VARCHAR(20)  DEFAULT '想去' COMMENT '打卡状态：想去/已去/常去',
    review           VARCHAR(500) DEFAULT '' COMMENT '点评/推荐理由',
    image_url        VARCHAR(255) DEFAULT '' COMMENT '门面或招牌菜照片链接（可选）',
    create_time      DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间，默认当前时间',
    update_time      DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，改数据自动刷新'
) COMMENT '美食宝藏馆收藏表';

-- ------------------------------------------------------------
-- 第三步：增删改查（CRUD）演示
-- ------------------------------------------------------------

-- 增：收藏一家宝藏馆子（必填项 name，其他用默认值）
INSERT INTO food_restaurant (user_id, name, cuisine, address, signature_dish, price_per_person, rating, tags, is_fit_diet, status, review)
VALUES (1, '老街巷子酸菜鱼', '川菜', '平顶山 湛河区 中兴路', '酸菜鱼', 45.00, 4.5, '宝藏小店,聚餐', 0, '想去', '朋友强推，说鱼片很嫩');

-- 查：查看所有收藏的馆子
SELECT * FROM food_restaurant;

-- 查：只挑还没去打卡的（为第03课 WHERE 进阶打基础）
SELECT name, cuisine, address FROM food_restaurant WHERE status = '想去';

-- 查：找出适合减脂期吃的馆子（贴合减脂场景）
SELECT name, cuisine, signature_dish FROM food_restaurant WHERE is_fit_diet = 1;

-- 改：去吃过之后，更新打卡状态和评分
UPDATE food_restaurant SET status = '已去', rating = 4.5 WHERE name = '老街巷子酸菜鱼';

-- 改：人均价格变了，更新一下
UPDATE food_restaurant SET price_per_person = 48.00 WHERE name = '老街巷子酸菜鱼';

-- 删：这家馆子倒闭了，删掉收藏
DELETE FROM food_restaurant WHERE name = '老街巷子酸菜鱼';

-- ------------------------------------------------------------
-- 第四步：真实初始收藏（鲁山本地馆子 · 先记下来）
-- ------------------------------------------------------------
-- 说明：以下为实际想去的馆子，仅填了已知字段（店名/菜系/位置）。
--       招牌菜、人均、评分、标签、点评等尚未确认，先留默认值，后续吃到再更新。
--       is_fit_diet 默认 0（减脂期保守按"不适合"记），火锅类高油高脂建议保持 0。
INSERT INTO food_restaurant (user_id, name, cuisine, address, status)
VALUES
(1, '巴庄火锅',       '火锅',   '鲁山 · 鲁山之窗',      '想去'),
(1, '巴腾火锅',       '火锅',   '鲁山 · 鲁山之窗',      '想去'),
(1, '土家菜',         '土家菜', '',                    '想去'),
(1, '一心美食私房菜', '私房菜', '',                    '想去'),
(1, '丁记三鲜烩面',   '河南烩面', '',                  '想去');

-- 查：看一眼刚加的 4 家鲁山馆子
SELECT name, cuisine, address, status FROM food_restaurant WHERE status = '想去';
