# CONTRIBUTING

本项目用于家庭多学科复习（英语/数学/语文），更新目标是：**每次迭代都能更精准地定位薄弱点，并把讲解和练习做成可复用资产**。

## 一、每轮更新标准流程

建议按下面 6 步执行，每步都落到文件：

1. 收集本轮练习数据（题目、孩子答案、正确答案）
2. 生成或更新错因分析（对应学科的 `analysis/`）
3. 提炼知识点讲义（对应学科的 `notes/`）
4. 调整交互练习原型（对应学科的 `prototype/`）
5. 做一轮小测复检（可先放在 `analysis/` 文末）
6. 记录本轮结论与下轮重点

---

## 二、目录与职责

### 历史英语主目录（保留）

- `analysis/`
  - 放“某次练习的分析报告”
  - 核心关注：错误类型、占比、根因、干预建议
- `grammar/`
  - 放“讲给孩子听”的疑难点讲义
  - 核心关注：规则解释、反例、口诀、高频变形表
- `prototype/`
  - 放可视化/交互页面
  - 核心关注：反馈即时、难度递进、孩子可独立操作

### 推荐的多学科目录（新增）

- `subjects/<subject>/analysis/`
- `subjects/<subject>/notes/`
- `subjects/<subject>/prototype/`

其中 `<subject>` 当前建议：`english`、`math`、`chinese`。

---

## 三、命名规范

### 1) 分析报告

文件名建议：

`analysis/student-error-analysis-YYYYMMDD.md`

示例：

`analysis/student-error-analysis-20260505.md`

### 2) 语法笔记

按主题聚合，避免碎片化命名；推荐：

`grammar/grammar-difficult-points.md`

如果后续体量变大，再拆分为：

- `grammar/word-formation.md`
- `grammar/tenses.md`
- `grammar/non-finite-verbs.md`

---

## 四、分析报告模板（建议）

每份 `analysis` 报告建议包含：

1. 基本信息：日期、年级、范围、题量、错误率
2. 总体评估：本轮最核心问题（1~3 条）
3. 错误类型分层：按严重度排序（含例题）
4. 根因解释：是规则不懂、词性意识弱，还是审题习惯问题
5. 干预建议：本周先抓什么，怎么练，怎么讲
6. 复测标准：达到什么表现算“掌握”

---

## 五、内容编写准则（面向孩子）

- 解释尽量口语化，避免术语堆叠
- 每个知识点都给“错误例句 vs 正确例句”
- 优先使用比喻（如“词性岗位”）帮助理解
- 一次只强调一个关键规则，避免一页信息过载
- 练习顺序：识别 -> 套用 -> 迁移

---

## 六、提交前检查清单

提交前至少确认：

- [ ] `README.md` 与当前目录结构一致
- [ ] `analysis/` 新报告中有“下轮重点”
- [ ] `grammar/` 的规则与 `analysis/` 发现的问题对应
- [ ] `prototype/` 中有与本轮 Top 错误类型对应的练习
- [ ] 文档内无真实隐私信息（学校/住址/联系方式等）

---

## 七、建议的 commit 信息风格

推荐使用简短前缀：

- `feat:` 新增功能/新练习模块
- `docs:` 文档补充与讲义完善
- `fix:` 修正错误结论或题目答案
- `refactor:` 不改行为的结构优化

示例：

- `docs: add weekly error analysis and intervention plan`
- `feat: add comparative adjective interactive drills`
- `fix: correct tense examples in grammar notes`

---

## 八、给 AI 助手的协作边界

可以让 AI 做：

- 错题归类和模式识别
- 讲义初稿和练习题生成
- 原型页面交互文案优化

需要家长最终把关：

- 是否符合孩子当前教材进度
- 题目难度是否合适
- 讲解是否“孩子听得懂”

AI 是提效工具，最终教学判断以家长与学校反馈为准。
