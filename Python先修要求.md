# Python 先修要求 · Crafts-Island 手艺岛

> 本文回答一个问题：**为了做这个项目，`python-100-days` 要学到哪里、学到什么程度。**
> 撰写：2026-10-18 ｜ 依据：本项目自身的 `零基础前置学习路线.md`、`项目实战开发路线.md`、`ARCHITECTURE.md`
> **本文只覆盖 Python 侧**（Java / Vue3 / Tauri / UniApp 不在本文范围）

---

## 一句话

**学到 `Day44`。** 不是 Day22 —— 因为它比 Agent 类项目多出两块：

| 多出来的一块 | 对应 100-days |
|---|---|
| **文档类接口**（Markdown 解析、导出 PDF） | **Day27**（Python 操作 PDF）+ Day30（正则） |
| **MySQL 数据库**（数据持久化 + 图表数据） | **Day21–22 → Day36–Day44**（SQL 全套 + **Day44 Python 接入 MySQL**） |

`Day44` = `04-数据库\Day44.Python接入MySQL数据库.md`

---

## 为什么是 Day44（本项目文档的原文依据）

**本项目自己写的 Python 要求**（`零基础前置学习路线.md:51-53`）：

> #### Python基础（FastAPI前置）
> - 基础语法、列表、字典、函数
> - 文件读写、日期处理、数据简单运算

**本项目自己写的 FastAPI 阶段要做什么**（`项目实战开发路线.md:42-50`）：

> 1. FastAPI 项目初始化，配置跨域、路由分层
> 2. **减脂打卡数据分析接口，输出 ECharts 趋势图数据**
> 3. **Markdown 解析、文档导出 PDF 接口开发**
> 4. 学习专注时长统计、汇总分析接口

再加上双后端架构里 **MySQL + Redis** 是唯一数据源（`项目实战开发路线.md:95`）→ 所以 Python 侧必须懂 SQL 与数据库接入。

---

## 学到什么程度才算够（验收标准）

| # | 能力 | 怎么验 |
|---|---|---|
| 1 | 基础语法 / 列表 / 字典 / 函数 / 类 | 不看资料写出一个数据处理函数 |
| 2 | **文件读写 + `try/except` + JSON/CSV** | 读一个 CSV，算出汇总，写成 JSON |
| 3 | **正则** | 从一段 Markdown 里提取标题/代码块 |
| 4 | **PDF 读写**（`reportlab` 生成 / `PyPDF2` 读） | 生成一个含中文的 PDF 文件 |
| 5 | **SQL 四类语句 + 索引** | 独立设计并写出多表关联查询 |
| 6 | **Python 连 MySQL**（`pymysql` / SQLAlchemy） | 用 Python 增删改查一张自己建的表 |
| 7 | （做图表接口时）pandas 汇总 | 用 pandas 把打卡记录聚合成 ECharts 要的数据 |
| 8 | FastAPI 起服务返回 JSON | 跑通一个 GET/POST 接口 ← **需自补，见下** |

**下限验收**：能用 Python 读 MySQL + 用 FastAPI 返回一个 JSON 接口。
**上限验收**：能把"减脂打卡 → 汇总分析 → 图表数据"这条线自己走通。

---

## 对应表：100-days 的哪几篇，用在本项目哪里

| 100-days | 内容 | 本项目里的用途 |
|---|---|---|
| Day01–17 | 语法 → 函数 | FastAPI 业务逻辑、数据预处理 |
| Day18–20 | 面向对象 | 数据模型、服务类 |
| **Day21** | 文件读写与异常 | Markdown 文件读写、异常兜底 |
| **Day22** | 序列化 / JSON | **前后端接口的数据格式** |
| Day23 | CSV | 数据导入导出 |
| Day26 | Word / PPT | 文档导出（可选） |
| **Day27** | **PDF** | **"文档导出 PDF 接口"** |
| Day30 | 正则 | **Markdown 解析** |
| Day36–43 | MySQL / SQL 全套 / 索引 | **十五大模块的表设计与查询** |
| **Day44** | **Python 接入 MySQL** | **FastAPI 连库** |
| Day66–80 | pandas / 可视化 | 减脂数据、专注时长统计（用到再补） |
| Day92 | Docker | 部署（可选） |

## 不必先学

**Day46–Day60（Django 全栈）——本项目用 FastAPI，不是 Django，整块跳过**
Day28–29（图像／邮件短信）｜Day61–65（爬虫）｜Day81–90（机器学习）

---

## ⚠️ python-100-days 不教、但本项目一定要用的

| 缺口 | 什么时候要 | 怎么补 |
|---|---|---|
| **虚拟环境 + pip 系统用法** | 第一阶段（搭环境） | 看一遍命令；建议按项目规范建 `venv` |
| **`.env` 环境变量** | API key / 数据库密码 | `python-dotenv` |
| **FastAPI** | 阶段三（第 11–14 天） | 100-days 教的是 Django，**FastAPI 必须另学**（路由/依赖注入/pydantic 模型） |
| **pydantic** | FastAPI 的请求/响应模型 | 跟 FastAPI 一起学 |
| **SQLAlchemy / pymysql** | 连 MySQL | Day44 教 pymysql，SQLAlchemy 另补 |
| **Redis** | 缓存 / 会话 | 本项目 `零基础前置学习路线.md` 第二阶段有 Redis，100-days 没有 |
| **类型提示 `typing`** | FastAPI 签名 | 现学 |
| **Java SpringBoot / Vue3** | 主后端与前端 | **不在本文范围**（本项目另有两套路线文档） |

## 当前进度

Python 线位点：**Day04 已学**（2026-10-18）→ 到 Day44 还差 **40 篇**（1 篇/天）。
仪表文件：`12-知识库\02-职业与发展\02-技术栈笔记\02-编程语言\Python\学习进度.md`
本项目自带路线：[`零基础前置学习路线.md`](零基础前置学习路线.md)（8 周）｜[`项目实战开发路线.md`](项目实战开发路线.md)（30 天）
