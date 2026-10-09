-- ============================================================
-- Crafts-Island 三端工具箱
-- 第 10 模块：GitHub 项目收藏（建表 + CRUD 实战）
-- 功能场景：刷到有趣的 GitHub 项目来不及细看？先收藏起来，以后慢慢看
-- 学习点：巩固第02课（建表、约束、CRUD），为第03课查询进阶打基础
-- ============================================================

-- ------------------------------------------------------------
-- 第一步：确认数据库存在（和 01 课保持一致，重复执行不报错）
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS crafts_island
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE crafts_island;

-- ------------------------------------------------------------
-- 第二步：创建收藏表 github_project
-- ------------------------------------------------------------
-- 字段设计思路（每一列都回答一个问题）：
--   repo_name   收藏的是哪个项目？（作者/项目名，比如 vuejs/vue）
--   repo_url    它的链接？（唯一，防止同一个项目重复收藏）
--   description 它是干嘛的？我为什么想收藏？
--   tags        打几个标签，以后好找（前端、AI工具……）
--   language    主要语言，快速判断是不是我能学的
--   star_count  收藏时的星标数，衡量热度
--   status      看的状态：待看 / 已看 / 学习中
--   create_time 什么时候收藏的
CREATE TABLE IF NOT EXISTS github_project (
    id          INT PRIMARY KEY AUTO_INCREMENT COMMENT '收藏ID，主键，自增',
    repo_name   VARCHAR(100) NOT NULL COMMENT '项目名，格式：作者/项目名，如 vuejs/vue',
    repo_url    VARCHAR(255) NOT NULL UNIQUE COMMENT 'GitHub链接，唯一（同一项目不重复收藏）',
    description VARCHAR(500) DEFAULT '' COMMENT '项目简介/为什么想收藏',
    tags        VARCHAR(200) DEFAULT '' COMMENT '标签，逗号分隔，如：前端,AI工具',
    language    VARCHAR(30)  DEFAULT '' COMMENT '主要语言，如：Java、Python、JavaScript',
    star_count  INT DEFAULT 0 COMMENT '收藏时的星标数',
    status      VARCHAR(20) DEFAULT '待看' COMMENT '状态：待看/已看/学习中',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间，默认当前时间'
) COMMENT 'GitHub开源项目收藏表';

-- ------------------------------------------------------------
-- 第三步：增删改查（CRUD）演示
-- ------------------------------------------------------------

-- 增：收藏一个项目（填必填项，其他用默认值）
INSERT INTO github_project (repo_name, repo_url, description, tags, language, star_count)
VALUES ('vuejs/vue', 'https://github.com/vuejs/vue', '前端框架，以后想深入学习', '前端,框架', 'JavaScript', 200000);

-- 查：查看所有收藏
SELECT * FROM github_project;

-- 查：只挑还没看过的（为第03课 WHERE 进阶打基础）
SELECT repo_name, repo_url, status FROM github_project WHERE status = '待看';

-- 改：看完它了，把状态改成「已看」
UPDATE github_project SET status = '已看' WHERE repo_name = 'vuejs/vue';

-- 删：这个项目不需要了，删掉收藏
DELETE FROM github_project WHERE repo_name = 'vuejs/vue';
