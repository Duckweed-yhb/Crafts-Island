-- ============================================================
-- Crafts-Island 三端工具箱
-- 第 1 课：创建数据库 + 用户表
-- 学习目标：建库、建表、主键、非空、注释、默认值、增删改查
-- ============================================================

-- ------------------------------------------------------------
-- 第一步：创建数据库
-- ------------------------------------------------------------
-- CREATE DATABASE：建库命令
-- IF NOT EXISTS：如果库已经存在就不重复创建（避免报错）
-- CHARACTER SET utf8mb4：字符集，能存中文和 emoji 表情
CREATE DATABASE IF NOT EXISTS crafts_island
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- 使用刚创建的数据库（告诉 MySQL 接下来操作哪个库）
USE crafts_island;

-- ------------------------------------------------------------
-- 第二步：创建用户表 user
-- ------------------------------------------------------------
-- 每个字段的写法：字段名  数据类型  约束  注释
-- 常见数据类型：
--   INT          整数（比如 id）
--   VARCHAR(50)  可变长度字符串，最多 50 个字符（存名字、密码等）
--   DATETIME     日期时间（存"创建时间"这种）
-- 常见约束：
--   PRIMARY KEY  主键：唯一标识一行，不能重复、不能为空
--   AUTO_INCREMENT 自增：MySQL 自动帮你 +1，不用手动填
--   NOT NULL     非空：这个字段必须有值
--   UNIQUE       唯一：值不能重复（比如用户名不能重名）
--   DEFAULT      默认值：不填就用这个值
--   COMMENT      注释：说明字段是干嘛的（好习惯！）
-- ------------------------------------------------------------
CREATE TABLE user (
    id          INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID，主键，自增',
    username    VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名，唯一',
    password    VARCHAR(255) NOT NULL COMMENT '密码，后续会用AES加密存储',
    nickname    VARCHAR(50)  DEFAULT '' COMMENT '昵称，可为空',
    email       VARCHAR(100) DEFAULT NULL COMMENT '邮箱，可为空',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间，默认当前时间'
) COMMENT '用户表';

-- ------------------------------------------------------------
-- 第三步：增删改查（CRUD）练习
-- ------------------------------------------------------------

-- 增：插入一条数据
INSERT INTO user (username, password, nickname) VALUES ('zhangsan', '123456', '张三');

-- 查：查询所有数据
SELECT * FROM user;

-- 查：带条件查询
SELECT username, nickname FROM user WHERE username = 'zhangsan';

-- 改：更新数据
UPDATE user SET nickname = '小张' WHERE username = 'zhangsan';

-- 删：删除数据
DELETE FROM user WHERE username = 'zhangsan';
