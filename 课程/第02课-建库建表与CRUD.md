# 第 02 课：建库建表与 CRUD 增删改查

> 学习目标：亲手创建项目的第一个数据库和第一张表，掌握增删改查（CRUD）。
> 配套脚本：`sql/01_用户表设计.sql`

---

## 一、建库（建一个"文件夹"）

```sql
CREATE DATABASE IF NOT EXISTS crafts_island
    DEFAULT CHARACTER SET utf8mb4;
```

- `IF NOT EXISTS`：如果库已存在就不重复创建，避免报错
- `utf8mb4`：字符集，能存中文和 emoji 表情
- 建库后要 `USE crafts_island;` 告诉 MySQL 接下来操作哪个库

---

## 二、建表（建一张 Excel 表）

每个字段的写法是：`字段名  数据类型  约束  注释`

```sql
CREATE TABLE user (
    id          INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID，主键，自增',
    username    VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名，唯一',
    password    VARCHAR(255) NOT NULL COMMENT '密码，后续用AES加密存储',
    nickname    VARCHAR(50)  DEFAULT '' COMMENT '昵称，可为空',
    email       VARCHAR(100) DEFAULT NULL COMMENT '邮箱，可为空',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
) COMMENT '用户表';
```

### 常见数据类型

| 类型 | 含义 |
|------|------|
| `INT` | 整数（比如 id） |
| `VARCHAR(50)` | 可变长度字符串，最多 50 个字符 |
| `DATETIME` | 日期时间（存"创建时间"） |

### 常见约束

| 约束 | 含义 |
|------|------|
| `PRIMARY KEY` | 主键：每行的"身份证号"，唯一且不能为空 |
| `AUTO_INCREMENT` | 自增：自动 +1，不用手动填 id |
| `NOT NULL` | 非空：必须有值 |
| `UNIQUE` | 唯一：不能重复（如用户名不能重名） |
| `DEFAULT` | 默认值：不填就用这个 |
| `COMMENT` | 注释：说明字段用途（好习惯） |

---

## 三、CRUD 增删改查（贯穿整个项目的 4 个操作）

### 增 INSERT
```sql
INSERT INTO user (username, password, nickname) VALUES ('zhangsan', '123456', '张三');
```

### 查 SELECT
```sql
SELECT * FROM user;                              -- 查所有
SELECT username, nickname FROM user WHERE username = 'zhangsan';  -- 带条件查
```

### 改 UPDATE
```sql
UPDATE user SET nickname = '小张' WHERE username = 'zhangsan';
```

### 删 DELETE
```sql
DELETE FROM user WHERE username = 'zhangsan';
```

> ⚠️ `UPDATE` 和 `DELETE` 一定要带 `WHERE`，否则会改/删全表！

---

## 四、动手练习

1. 打开 DBeaver，连接 MySQL
2. 执行 `sql/01_用户表设计.sql`
3. 自己敲（别抄）下面 4 句，观察结果变化：

```sql
INSERT INTO user (username, password, nickname) VALUES ('xiaoming', 'abc123', '小明');
SELECT * FROM user WHERE username = 'xiaoming';
UPDATE user SET nickname = '小明明' WHERE username = 'xiaoming';
DELETE FROM user WHERE username = 'xiaoming';
```

---

## 五、完成标准

- [ ] 库 `crafts_island` 建出来了
- [ ] 表 `user` 建出来了
- [ ] 增删改查 4 条 SQL 都能跑通

> 全部打勾后，进入第 03 课学习查询进阶。
