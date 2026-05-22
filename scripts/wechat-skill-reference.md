> **来源：** [Wechat-ggGitHub/wechat-claude-code](https://github.com/Wechat-ggGitHub/wechat-claude-code)（MIT License）
> 此文件为该项目的 SKILL.md 副本，仅作为参考。
> 安装时请使用原始项目，以获取最新版本。

---

---
name: wechat-claude-code
description: 微信消息桥接 - 在微信中与 Claude Code 聊天。支持文字对话、图片识别、权限审批、斜杠命令。
---

# WeChat Claude Code Bridge

通过个人微信与本地 Claude Code 进行对话。

## 前置条件

- Node.js >= 18
- macOS（daemon 使用 launchd 管理）
- 个人微信账号（需扫码绑定）
- 已安装 Claude Code

## 安装

```bash
# 克隆项目
git clone https://github.com/Wechat-ggGitHub/wechat-claude-code.git ~/.claude/skills/wechat-claude-code

# 安装依赖
cd ~/.claude/skills/wechat-claude-code
npm install

# 构建
npm run build
```

## 配置

在 `.claude/settings.json` 或 `settings.local.json` 中添加：

```json
{
  "skills": ["wechat-claude-code"]
}
```

## 启动

```bash
# 通过 daemon 启动（推荐）
~/.claude/skills/wechat-claude-code/scripts/daemon.sh start

# 或手动启动
node ~/.claude/skills/wechat-claude-code/dist/main.js
```

启动后扫描终端中的二维码完成微信登录，即可在微信中与 Claude Code 对话。

## 功能

- **文字消息**：在微信中发送消息，Claude Code 直接回复
- **图片识别**：发送图片，Claude Code 可识别并描述
- **权限审批**：通过微信审批工具调用请求
- **斜杠命令**：支持 `/help` 等快捷命令

## 注意事项

- 需要保持终端运行（daemon 模式会自动管理）
- 微信账号需保持在线
- 首次使用需要扫码登录
