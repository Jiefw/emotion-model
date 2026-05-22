#!/bin/bash
# Setup WeChat Claude Code Bridge
# Run: bash scripts/setup-wechat.sh

set -e

SKILL_DIR="$HOME/.claude/skills/wechat-claude-code"
REPO_URL="https://github.com/Wechat-ggGitHub/wechat-claude-code.git"

echo "📦 Installing WeChat Claude Code Bridge..."

if [ -d "$SKILL_DIR" ]; then
  echo "⚠️  Skill already exists at $SKILL_DIR"
  echo "   To update: cd $SKILL_DIR && git pull && npm install && npm run build"
  exit 0
fi

# Clone
echo "📥 Cloning from $REPO_URL ..."
git clone "$REPO_URL" "$SKILL_DIR"

# Install & build
echo "🔧 Installing dependencies..."
cd "$SKILL_DIR"
npm install
npm run build

# Enable skill
echo "⚙️  Enabling skill..."
mkdir -p "$HOME/.claude"
SKILL_ENABLED=$(cat "$HOME/.claude/settings.local.json" 2>/dev/null | python3 -c "
import json,sys
try:
    d=json.load(sys.stdin)
except:
    d={}
skills=d.get('skills',[])
if 'wechat-claude-code' not in skills:
    skills.append('wechat-claude-code')
    d['skills']=skills
print(json.dumps(d,indent=2))
" 2>/dev/null || echo '{"skills":["wechat-claude-code"]}')

echo "$SKILL_ENABLED" > "$HOME/.claude/settings.local.json"

echo ""
echo "✅ WeChat Claude Code Bridge installed!"
echo ""
echo "启动: $SKILL_DIR/scripts/daemon.sh start"
echo "日志: $SKILL_DIR/scripts/daemon.sh logs"
echo "停止: $SKILL_DIR/scripts/daemon.sh stop"
echo ""
echo "启动后扫码登录微信即可使用。"
