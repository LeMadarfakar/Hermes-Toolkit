#!/bin/bash
# install-all.sh — One-command installer for Hermes Toolkit
# Run: ./scripts/install-all.sh

set -euo pipefail

echo "🚀 Installing Hermes AI Agent Toolkit..."
echo ""

# Check prerequisites
check_cmd() {
    if ! command -v "$1" &> /dev/null; then
        echo "❌ $1 not found. Please install $1 first."
        exit 1
    fi
    echo "✅ $1 found"
}

echo "Checking prerequisites..."
check_cmd node
check_cmd npm
check_cmd python3
check_cmd pip
check_cmd git

echo ""
echo "📦 Installing npm global packages..."
npm install -g @upstash/context7-mcp ctx7 chrome-devtools-mcp@latest

echo ""
echo "🐍 Installing Python packages..."
pip install git+https://github.com/Panniantong/Agent-Reach.git

echo ""
echo "📁 Setting up Hermes skills..."
HERMES_SKILLS_DIR="${HOME}/.hermes/skills/app-cloning"
mkdir -p "$HERMES_SKILLS_DIR"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(dirname "$SCRIPT_DIR")"
cp -r "$TOOLKIT_ROOT/hermes-skills/app-cloning/"* "$HERMES_SKILLS_DIR/"
echo "✅ Skills copied to $HERMES_SKILLS_DIR"

echo ""
echo "🔧 Setting up REA (Reverse Engineer Anything)..."
REA_DIR="${HOME}/brain/rea"
if [ ! -d "$REA_DIR" ]; then
    git clone https://github.com/morluto/rea.git "$REA_DIR"
    cd "$REA_DIR"
    npm install
    npm run build
    echo "✅ REA built"
else
    echo "✅ REA already exists at $REA_DIR"
fi

echo ""
echo "📋 Configuring Hermes MCP servers..."
CONFIG_FILE="${HOME}/.hermes/config.yaml"
if [ -f "$CONFIG_FILE" ]; then
    echo "⚠️  ~/.hermes/config.yaml exists."
    echo "   Please MANUALLY merge hermes-config/mcp-servers.yaml into it."
    echo "   Or run: hermes config set mcp_servers.context7.url https://mcp.context7.com/mcp"
else
    echo "⚠️  ~/.hermes/config.yaml not found. Run Hermes once to create it, then merge mcp-servers.yaml"
fi

echo ""
echo "🔐 Setting up environment variables..."
ENV_FILE="${HOME}/.hermes/.env"
if [ ! -f "$ENV_FILE" ]; then
    cp "$TOOLKIT_ROOT/.env.example" "$ENV_FILE"
    echo "✅ Created ~/.hermes/.env from template"
    echo "⚠️  EDIT ~/.hermes/.env AND ADD YOUR CONTEXT7_API_KEY"
else
    echo "✅ ~/.hermes/.env already exists"
fi

echo ""
echo "📚 Optional: Sync tools to Obsidian vault..."
VAULT_DIR="${HOME}/brain/tools"
if [ ! -d "$VAULT_DIR" ]; then
    mkdir -p "$VAULT_DIR"
    cp -r "$TOOLKIT_ROOT/tools/"* "$VAULT_DIR/"
    echo "✅ Tools synced to $VAULT_DIR"
else
    echo "✅ Vault tools directory exists"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ INSTALLATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 NEXT STEPS:"
echo "1. Edit ~/.hermes/.env and add your CONTEXT7_API_KEY"
echo "2. Merge hermes-config/mcp-servers.yaml into ~/.hermes/config.yaml"
echo "3. Restart Hermes (fully quit + reopen)"
echo "4. Verify in Settings → MCP Servers: context7 + chrome-devtools = GREEN"
echo "5. Run 'npx rea-agents setup' to register REA"
echo ""
echo "🎯 Test commands:"
echo "   ctx7 library react \"hooks\""
echo "   agent-reach github search \"test\""
echo "   /replica-recon \"clone Linear\""
echo ""