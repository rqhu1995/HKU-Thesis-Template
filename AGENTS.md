# Thesis Final Sprint Agent Rules（论文最终冲刺阶段代理规则）

本仓库处于博士论文整合的最后冲刺阶段。当前最高优先级是在 2026-06-29 前生成一份可提交给导师审阅的 PDF（supervisor-ready PDF）。

## 事实来源（Source of truth）

* 论文正式源文件位于仓库根目录及各正式论文目录中，包括 `main.tex`、`HKUThesis.cls`、`thesis.bib`、`Abstract/`、`Acknowledgments/`、`Abbreviations/`、`Symbols/`、`Covers/`、`Titlepage/`、`Declaration/`、`Copyrights/`、`Dedication/`、`Publications/`、`Chapters/`、`Appendices/` 和 `Figures/`。其中 `Chapters/`、`Appendices/`、front matter 文件和 `thesis.bib` 是主要论文内容修改对象。
* `three-papers/Paper1.tex`、`three-papers/Paper2.tex` 和 `three-papers/Paper3.tex` 仅作为参考来源，禁止修改。
* `tracking/tracker_state.yml`、`tracking/daily_log.md` 和 `tracking/issue_register.yml` 是进度跟踪的唯一事实来源。
* `tracking/tracker.xlsx` 是自动生成的人类可视化看板，不是唯一事实来源；除非有明确指示，否则不得手动编辑。

## 范围规则（Scope rules）

不得引入新的模型、新的实验、新的数值结果，或扩展大规模文献综述范围。

除非提示中明确要求，否则不得修改以下内容：

* 数学公式；
* 表格数值；
* 算法逻辑；
* 标签（labels）；
* 引用（citations）。

当被要求修改文本时，仅允许修改指定的文件和指定的章节或段落。

## 修改后的必要检查（Required checks after edits）

每次进行实质性修改后，必须执行以下步骤：

1. 运行本仓库使用的 LaTeX 编译命令。
2. 报告以下内容：

   * 修改过的文件；
   * 编译状态；
   * 未定义引用（undefined references）；
   * 未定义文献引用（undefined citations）；
   * 缺失的图像；
   * TODO/FIXME/占位符（placeholder）出现情况；
   * 仅在严重情况下报告 overfull/underfull 警告。
3. 如果本次任务涉及进度更新，则必须更新 `tracking/tracker_state.yml`，并重新生成 `tracking/tracker.xlsx`。

## 进度跟踪规则（Tracking rules）

对于每一个完成的工作块（work block），需要更新以下信息：

* 工作块状态（block status）；
* 完成比例（completion ratio）；
* 实际耗时（如果提供）；
* 产出/证据（outputs/evidence）；
* 阻塞问题（blockers）；
* 下一工作块（next block）；
* 若提供，则更新按日期汇总的信息（date-level summary）。

除非用户或 ChatGPT 明确说明该工作块已完成，或所有验收标准均已满足，否则不得将其标记为完成。

## 与 ChatGPT 网页端的文件同步规则（ChatGPT Web Upload Rules）

Codex 可以在必要时通过 computer use 控制 ChatGPT 网页端上传文件，但该操作较慢，且容易造成版本混乱。因此，默认原则是：

**不要持续同步，不要全量同步，不要在每次小修改后上传文件。**

只有在以下情况中，才允许上传文件到 ChatGPT 网页端。

### 1. 总控 conversation 的同步

总控 conversation 只用于计划、风险和 tracker 管理，不用于逐段改写正文。

在以下时点，可以向总控 conversation 上传或更新文件：

* 每天开始前；
* 每天结束后；
* 重要里程碑前后；
* 用户明确要求更新 tracker；
* P0 进度或风险状态发生重大变化。

优先上传或更新：

* `tracking/tracker_state.yml`
* `tracking/daily_log.md`
* `tracking/issue_register.yml`
* `tracking/tracker.xlsx`
* 最新的日终或阶段性 Codex report，例如 `tracking/codex_reports/2026-06-24_W1.md`

如果上传过程太慢，优先不要上传文件，而是在 ChatGPT 中粘贴一个简短 status capsule，格式如下：

```text
当前 repo commit:
当前 tracker_state 更新时间:
今日工作块:
当前 P0:
图片恢复:
build errors:
undefined citations/references:
最新 Codex report 摘要:
下一步建议:
```

### 2. 每日执行 conversation 的同步

每日执行 conversation 只处理当天任务。不要把整个仓库上传到每日 conversation。

在每日 conversation 中，仅上传当天任务所需文件：

* 如果任务是验收 Codex 修改：上传对应的 Codex report 或 diff。
* 如果任务是检查某一章：上传该章 `.tex` 文件，或上传该章相关 diff。
* 如果任务是检查引用：上传相关 `.tex` 段落、相关 `.bib` entries、Codex 的 PDF-first citation verification 摘要。
* 如果任务是检查编译问题：上传或粘贴精简后的 build error summary，不上传完整冗长日志，除非错误无法定位。
* 如果任务是视觉审查：上传最新 `main.pdf` 或相关页面截图。

优先级为：

1. 上传 diff 或 Codex report；
2. 上传相关 section 提取文件；
3. 上传完整单章 `.tex`；
4. 只有在用户明确要求或无法局部判断时，才上传多个章节或完整 bundle。

### 3. 什么时候上传 `tracker.xlsx`

`tracking/tracker.xlsx` 是生成出来的人类可视化看板，不是唯一事实来源。

只在以下情况下上传：

* 用户明确要求“更新 Excel / tracker”；
* 每日结束后需要总控 conversation 记录进度；
* 6 月 28 日内容冻结前；
* 6 月 29 日 supervisor-ready 提交前；
* tracker 结构发生变化，例如新增 sheet、字段或同步方案；
* 需要人工视觉检查 tracker 是否正确。

不要在每个工作块后上传 `tracker.xlsx`。每个工作块后只更新 `tracker_state.yml` 和 `daily_log.md`，必要时贴摘要给 ChatGPT。

### 4. 什么时候上传论文 `.tex` 文件

不要反复上传全部 `.tex` 文件。

只有在 ChatGPT 需要阅读或判断具体文本时，才上传相应文件：

* Chapter 1/2 写作或验收：上传对应 chapter `.tex`；
* Chapter 3/4/5 整合检查：优先上传 diff；必要时上传对应 chapter `.tex`；
* Chapter 6 综合结论重写：上传 Chapter 6 `.tex` 和 thesis spine；
* 附录接口检查：上传相关 appendix `.tex` 和调用它的 chapter diff；
* 全文一致性检查：优先上传 merged bundle，而不是整个仓库。

如果只是让 ChatGPT 判断进度，不上传 `.tex`，只上传或粘贴 Codex report 即可。

### 5. 什么时候上传 `main.pdf`

`main.pdf` 文件较大，只在视觉审查或里程碑验收时上传。

允许上传的情况：

* 内容冻结前的完整阅读；
* supervisor-ready PDF 生成后；
* 图表、算法、表格、目录、附录或分页存在视觉问题；
* 用户明确要求 ChatGPT 检查 PDF；
* 需要比较 PDF 与 `.tex` 修改是否一致。

不要在每次 LaTeX 编译后上传 `main.pdf`。

### 6. 什么时候上传编译日志

默认不要上传完整编译日志。

Codex 应优先生成精简摘要，内容包括：

* build status；
* fatal errors；
* undefined references；
* undefined citations；
* missing figures；
* duplicate labels；
* severe overfull boxes；
* TODO/FIXME/placeholder count。

只有在错误复杂、ChatGPT 无法根据摘要判断时，才上传完整 log。

### 7. 什么时候上传 Zotero / 文献 / PDF 相关材料

引用核查遵守 PDF-first 原则。

Codex 应优先在本地读取 Zotero PDF 原文并生成 citation verification summary。ChatGPT 通常只需要读取该 summary，而不需要读取所有 PDF。

只有在以下情况下上传文献 PDF 或相关材料：

* ChatGPT 需要判断某一引用是否真正支持某句话；
* Codex 无法从本地 PDF 得到明确结论；
* 用户明确要求 ChatGPT 阅读原文；
* 某个 citation 是 P0 风险，且影响 Chapter 1/2/6 的关键论证。

不要为了普通 citation screening 上传大量 PDF。

### 8. 什么时候上传 thesis spine 和 AGENTS.md

`tracking/thesis_spine_2026-06-23.md` 是冻结主线文件。通常只需要在新 Project 或新总控 conversation 开始时上传一次。

只有在以下情况中重新上传：

* thesis spine 被用户明确修改；
* 新开 Project；
* 新开总控 conversation；
* ChatGPT 明确表示当前 conversation 缺少 thesis spine；
* 需要检查某次修改是否偏离 frozen thesis spine。

`AGENTS.md` 是 Codex 行为规则。只有在规则被修改后，才需要上传或贴给 ChatGPT 备案。

### 9. 上传文件命名规则

所有上传给 ChatGPT 的文件必须使用清楚的日期和用途命名，避免旧文件混淆。

推荐格式：

```text
tracker_2026-06-24_eod.xlsx
tracker_state_2026-06-24_eod.yml
daily_log_2026-06-24.md
issue_register_2026-06-24.yml
codex_report_2026-06-24_W1.md
chapter1_after_codex_2026-06-24.tex
chapter4_diff_2026-06-26_F5.patch
main_pdf_2026-06-28_content_freeze.pdf
```

不要上传名为 `final.pdf`、`new.tex`、`updated.xlsx`、`report.md` 这类无法判断版本的文件。

### 10. 上传后的必要说明

每次 Codex 上传文件到 ChatGPT 后，必须同时在聊天框中说明：

```text
已上传文件：
- 文件名：
- 来源路径：
- 对应 repo commit：
- 用途：
- 是否为最新版本：
- 希望 ChatGPT 检查什么：
- 不需要 ChatGPT 检查什么：
```

示例：

```text
已上传文件：
- 文件名：codex_report_2026-06-24_W1.md
- 来源路径：tracking/codex_reports/2026-06-24_W1.md
- 对应 repo commit：abc1234
- 用途：验收昨晚 Chapter 1 Codex 修改
- 是否为最新版本：是
- 希望 ChatGPT 检查：files changed、word count、citation plan、undefined citations、build status、是否符合 thesis spine
- 不需要 ChatGPT 检查：不要全文重写 Chapter 1
```

### 11. 禁止上传或不建议上传的情况

除非用户明确要求，不要上传：

* 整个仓库；
* 所有 figures；
* 所有 Zotero PDFs；
* 完整 LaTeX build log；
* 每次小改后的 `main.pdf`；
* 所有 chapter `.tex`；
* LaTeX 编译中间文件，例如 `*.aux`、`*.log`、`*.bcf`、`*.bbl` 等，除非用户明确要求调试；
* 过期 tracker；
* 未命名或无法识别版本的临时文件。

如果不确定是否需要上传，应先生成摘要，并询问用户是否需要上传文件，而不是直接上传大量材料。

### 12. 最小同步原则

每次同步都应遵守以下顺序：

1. 先更新本地 repo 中的事实来源文件；
2. 先生成简短文字摘要；
3. 只有摘要不足以让 ChatGPT 判断时，才上传文件；
4. 优先上传小文件、diff、report；
5. 最后才上传完整 `.tex`、`.xlsx` 或 `.pdf`。

目标是让 ChatGPT 获得足够信息做判断，而不是让 ChatGPT 成为本地仓库的镜像。


## 写作规则（Writing rules）

使用论文写作风格，而非期刊投稿稿件风格。

避免以下表达或问题：

* 在指代论文时使用 “this paper”；
* 使用类似审稿回复（reviewer response）的语气；
* 防御性地强调创新性；
* 使用未经结果支持的表述，例如 robust、comprehensive、highly efficient、significant 等；
* 过度夸大 UDF、EUDF 或损坏车辆建模的创新性。

必须保持已冻结的论文主线结构：

* Chapter 3 = 方法论基础（methodological foundation）；
* Chapter 4 = 运作层核心（operational pillar）；
* Chapter 5 = 方法与运作的综合（methodological and operational synthesis）。
