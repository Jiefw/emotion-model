# Emotion Model

基于 Karpathy [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 模式的个人情感建模框架。

将 Claude Code 作为情感观察者，Obsidian 作为知识库 IDE，持续累积对自我情感结构、依恋模式、防御机制的理解。

## 架构

```
原始资料                Wiki（LLM维护）            Schema
（对话/日记）           Obsidian Vault             CLAUDE.md + SKILL.md
                              ├── entities/    ← 五维模型
                              ├── reflections/ ← 反思记录
                              ├── visual/      ← 关系模式图
                              ├── index.md     ← 目录
                              └── log.md       ← 变更日志
```

## 核心文件

- [`CLAUDE.md`](./CLAUDE.md) — 角色定义 + 对话风格 + 建模框架 + Wiki 规范
- [`.claude/skills/emotional-modeling/SKILL.md`](./.claude/skills/emotional-modeling/SKILL.md) — 后台建模 observer 定义

## 使用方式

1. 将 CLAUDE.md 放入你的 Claude Code 项目根目录
2. 在 Obsidian 中建立 emotional-wiki/ 目录
3. 安装 Dataview / Templater / Excalidraw 插件
4. 开始对话，LLM 会自动维护 wiki

## 五维度框架

| 维度 | 观察目标 |
|------|---------|
| 依恋模式 | 如何靠近/远离关系，应对不确定性 |
| 防御机制 | 理智化、回避、讨好等模式 |
| 自我叙事 | 反复出现的核心关系信念 |
| 关系动力学 | 被何种人吸引，如何进入/逃离关系 |
| 潜意识矛盾 | 嘴上想要 vs 真正被吸引的 |

## 致谢

- [Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — 模式灵感
