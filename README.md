# primary-school

面向家庭场景的小学复习项目：用可视化、交互式练习和 AI 分析，帮助孩子定位薄弱知识点、针对性讲解并通过小测验证掌握情况。当前以英语为主，已预留数学和语文的同构流程。

## 项目目标

- 用孩子能接受的方式讲知识点：故事化、闯关化、可视化
- 从错题中自动归因：不是只看对错，而是定位“为什么错”
- 对齐上海小学核心考点：英语/数学/语文分学科迭代
- 形成闭环：讲解 -> 练习 -> 复测 -> 再分析

## 当前内容

- `prototype/grammar-teaching.html`
  - 交互式语法教学原型（闯关风格 UI）
  - 适合给孩子边看边练，降低枯燥感
- `analysis/student-error-analysis-20260505.md`
  - 一次完整错题分析样例（错误类型、占比、根因、建议）
- `subjects/english/notes/grammar-difficult-points.md`
  - 英语疑难语法笔记（高频易错点 + 讲解话术 + 速记）
- `subjects/`
  - 多学科骨架目录（`english/`、`math/`、`chinese/`）
  - 每个学科统一包含 `analysis/`、`notes/`、`prototype/`、`exams/` 模板

## 使用方式（本地）

最简单方式：直接在浏览器打开原型页面。

```bash
open prototype/grammar-teaching.html
```

创建新分析文件（支持多学科）：

```bash
# 旧方式：在根 analysis 下按日期创建
./scripts/new-analysis.sh 20260512

# 新方式：按学科创建（english/math/chinese）
./scripts/new-analysis.sh english 20260512
./scripts/new-analysis.sh math 20260512
./scripts/new-analysis.sh chinese 20260512
```

创建新讲义文件（按学科）：

```bash
# 默认用当天日期命名
./scripts/new-note.sh english
./scripts/new-note.sh math
./scripts/new-note.sh chinese

# 指定文件名（不含 .md）
./scripts/new-note.sh english adjective-adverb-basics
./scripts/new-note.sh math fraction-word-problems
./scripts/new-note.sh chinese reading-main-idea
```

创建新复测卷（按学科）：

```bash
# 默认用当天日期命名 exam-YYYYMMDD.md
./scripts/new-exam.sh english
./scripts/new-exam.sh math
./scripts/new-exam.sh chinese

# 指定日期或自定义文件名
./scripts/new-exam.sh english 20260512
./scripts/new-exam.sh math week2-retest
./scripts/new-exam.sh chinese reading-retest-1
```

## 建议的学习工作流

1. 先做一套题（课堂/练习册/自编小测）
2. 把错题整理成分析输入（题目、孩子答案、正确答案）
3. 基于分析结果更新：
   - `subjects/<subject>/analysis/`：新增一次分析报告
   - `subjects/<subject>/notes/`：补充相应知识点讲义
   - `subjects/<subject>/prototype/`：加入对应交互练习
   - `subjects/<subject>/exams/`：生成复测卷并记录结果
4. 再做一轮针对性小测，观察是否从“会做题”变成“能解释规则”

## 多学科扩展建议

- 英语：优先保留现有主线（词性、时态、搭配）
- 数学：按“概念/审题/计算/步骤”四类错因拆解
- 语文：按“字词/阅读定位/表达结构”拆解
- 各学科都复用相同闭环：`analysis -> notes -> prototype -> retest`

## 给 AI 助手的协作指令（可直接复制）

```text
这是一个给小学生做多学科复习的项目，请按“先诊断再干预”的思路协作：
1) 读取对应学科的 analysis 报告，归纳 Top 3 薄弱点
2) 在对应学科的 notes 中补充可讲给孩子听的解释（比喻+反例+口诀）
3) 在对应学科的 prototype 中设计互动练习（先易后难，立即反馈）
4) 生成一份 10~15 题的小测用于复检掌握情况
5) 输出“本轮掌握/未掌握”结论和下一轮建议
```

## 迭代计划（下一步）

- 增加“错题数据结构化”文件（如 `data/errors/*.json`），便于自动统计
- 按知识点拆分原型页面，支持按薄弱点定制练习
- 增加“上海考点标签”维度（如词法/句法/阅读语法）
- 增加复测评分卡（正确率、稳定度、是否能口头解释规则）

## 说明

- 本项目是家庭教育辅助工具，不替代学校教学与老师反馈
- 内容应以孩子当前教材和学校进度为主，AI 作为加速器而不是替代者
