<# 
.SYNOPSIS
    install-all.ps1 — One-command installer for Hermes AI Agent Toolkit (Windows)

.DESCRIPTION
    Installs all npm packages, Python packages, Hermes skills, REA, and configures MCP servers.

.EXAMPLE
    .\scripts\install-all.ps1
#>

param()

$ErrorActionPreference = "Stop"

Write-Host "🚀 Installing Hermes AI Agent Toolkit..." -ForegroundColor Green
Write-Host ""

# Check prerequisites
function Check-Cmd {
    param([string]$Name)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        Write-Host "❌ $Name not found. Please install $Name first." -ForegroundColor Red
        exit 1
    }
    Write-Host "✅ $Name found" -ForegroundColor Green
}

Write-Host "Checking prerequisites..." -ForegroundColor Cyan
Check-Cmd "node"
Check-Cmd "npm"
Check-Cmd "python"
Check-Cmd "pip"
Check-Cmd "git"

Write-Host ""
Write-Host "📦 Installing npm global packages..." -ForegroundColor Cyan
npm install -g @upstash/context7-mcp ctx7 chrome-devtools-mcp@latest

Write-Host ""
Write-Host "🐍 Installing Python packages..." -ForegroundColor Cyan
pip install git+https://github.com/Panniantong/Agent-Reach.git

Write-Host ""
Write-Host "📁 Setting up Hermes skills..." -ForegroundColor Cyan
$HermesSkillsDir = Join-Path $env:APPDATA "hermes\skills\app-cloning"
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
$ToolkitRoot = Split-Path $ScriptDir -Parent
New-Item -ItemType Directory -Force -Path $HermesSkillsDir | Out-Null
Copy-Item -Path (Join-Path $ToolkitRoot "hermes-skills\app-cloning\*") -Destination $HermesSkillsDir -Recurse -Force
Write-Host "✅ Skills copied to $HermesSkillsDir" -ForegroundColor Green

Write-Host ""
Write-Host "🔧 Setting up REA (Reverse Engineer Anything)..." -ForegroundColor Cyan
$ReaDir = "D:\brain\rea"
if (-not (Test-Path $ReaDir)) {
    git clone https://github.com/morluto/rea.git $ReaDir
    Set-Location $ReaDir
    npm install
    npm run build
    Write-Host "✅ REA built" -ForegroundColor Green
} else {
    Write-Host "✅ REA already exists at $ReaDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "📋 Configuring Hermes MCP servers..." -ForegroundColor Cyan
$ConfigFile = Join-Path $env:APPDATA "hermes\config.yaml"
if (Test-Path $ConfigFile) {
    Write-Host "⚠️  ~/.hermes/config.yaml exists." -ForegroundColor Yellow
    Write-Host "   Please MANUALLY merge hermes-config/mcp-servers.yaml into it." -ForegroundColor Yellow
    Write-Host "   Or run: hermes config set mcp_servers.context7.url https://mcp.context7.com/mcp" -ForegroundColor Yellow
} else {
    Write-Host "⚠️  ~/.hermes/config.yaml not found. Run Hermes once to create it, then merge mcp-servers.yaml" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🔐 Setting up environment variables..." -ForegroundColor Cyan
$EnvFile = Join-Path $env:APPDATA "hermes\.env"
if (-not (Test-Path $EnvFile)) {
    Copy-Item (Join-Path $ToolkitRoot ".env.example") $EnvFile
    Write-Host "✅ Created ~/.hermes/.env from template" -ForegroundColor Green
    Write-Host "⚠️  EDIT ~/.hermes/.env AND ADD YOUR CONTEXT7_API_KEY" -ForegroundColor Yellow
} else {
    Write-Host "✅ ~/.hermes/.env already exists" -ForegroundColor Green
}

Write-Host ""
Write-Host "📚 Optional: Sync tools to Obsidian vault..." -ForegroundColor Cyan
$VaultDir = "D:\brain\tools"
if (-not (Test-Path $VaultDir)) {
    New-Item -ItemType Directory -Force -Path $VaultDir | Out-Null
    Copy-Item -Path (Join-Path $ToolkitRoot "tools\*") -Destination $VaultDir -Recurse -Force
    Write-Host "✅ Tools synced to $VaultDir" -ForegroundColor Green
} else {
    Write-Host "✅ Vault tools directory exists" -ForegroundColor Green
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "✅ INSTALLATION COMPLETE" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host ""
Write-Host "📋 NEXT STEPS:" -ForegroundColor Cyan
Write-Host "1. Edit ~/.hermes/.env and add your CONTEXT7_API_KEY"
Write-Host "2. Merge hermes-config/mcp-servers.yaml into ~/.hermes/config.yaml"
Write-Host "3. Restart Hermes (fully quit + reopen)"
Write-Host "4. Verify in Settings → MCP Servers: context7 + chrome-devtools = GREEN"
Write-Host "5. Run 'npx rea-agents setup' to register REA"
Write-Host ""
Write-Host "🎯 Test commands:" -ForegroundColor Cyan
Write-Host "   ctx7 library react \"hooks\""
Write-Host "   agent-reach github search \"test\""
Write-Host "   /replica-recon \"clone Linear\""
Write-Host ""