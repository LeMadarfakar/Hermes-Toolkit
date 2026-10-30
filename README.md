# Hermes AI Agent Toolkit

Complete portable setup for Hermes Agent with MCP servers, skills, and tools. Sync across machines via Git.

## 📦 Contents

```
hermes-toolkit/
├── .env.example                    # Environment template (copy to ~/.hermes/.env)
├── .gitignore
├── README.md
├── hermes-config/
│   └── mcp-servers.yaml           # MCP server configs (merge into ~/.hermes/config.yaml)
├── hermes-skills/
│   └── app-cloning/               # 11 Replica skills (app-cloning pipeline)
│       ├── replica-recon/
│       ├── replica-architect/
│       ├── replica-design/
│       ├── replica-build/
│       ├── replica-backend/
│       ├── replica-test/
│       ├── replica-diff/
│       ├── replica-entrepreneur/
│       ├── replica-brand/
│       ├── replica-launch/
│       └── replica-deploy/
├── tools/
│   ├── README.md                   # Master index of all tools
│   ├── replica-skills/             # Same as hermes-skills/ (for vault)
│   ├── agent-reach/                # Multi-platform internet access (13+ channels)
│   ├── context7/                   # Up-to-date code docs MCP
│   ├── chrome-devtools-mcp/        # Browser automation/debugging MCP
│   └── rea/                        # Reverse Engineer Anything
└── scripts/
    ├── install-all.sh              # One-command installer for new machine
    └── install-all.ps1             # Windows PowerShell installer
```

## 🚀 Quick Setup (New Machine)

### Prerequisites
- Windows 10/11, Node.js 20+, Python 3.10+, Git
- Hermes Agent installed

### One-Command Install
```bash
git clone https://github.com/YOUR_USERNAME/hermes-toolkit.git
cd hermes-toolkit
./scripts/install-all.sh
```

### Manual Steps

1. **Install npm packages:**
```bash
npm install -g @upstash/context7-mcp ctx7 chrome-devtools-mcp@latest
```

2. **Install Python packages:**
```bash
pip install git+https://github.com/Panniantong/Agent-Reach.git
```

3. **Configure Hermes MCP servers:**
```bash
# Merge hermes-config/mcp-servers.yaml into ~/.hermes/config.yaml
# Add CONTEXT7_API_KEY to ~/.hermes/.env (copy from .env.example)
```

4. **Install Replica skills:**
```bash
# Copy hermes-skills/app-cloning/ to ~/.hermes/skills/app-cloning/
cp -r hermes-skills/app-cloning ~/.hermes/skills/
```

5. **Install REA (Reverse Engineer Anything):**
```bash
git clone https://github.com/morluto/rea.git ~/brain/rea
cd ~/brain/rea && npm install && npm run build
npx rea-agents setup
```

6. **Restart Hermes** — verify MCP servers in Settings → MCP Servers

## 🔧 Tools Overview

### MCP Servers (configured in Hermes)
| Server | Purpose | Config |
|--------|---------|--------|
| **Context7** | Up-to-date library docs | `mcp-servers.yaml` |
| **Chrome DevTools** | Browser automation/debugging | `mcp-servers.yaml` |
| **REA** | Binary/app reverse engineering | `npx rea-agents setup` |

### Skills (in `~/.hermes/skills/app-cloning/`)
| Skill | Purpose |
|-------|---------|
| `replica-recon` | Reverse-engineer any app |
| `replica-architect` | Plan stack, DB, API |
| `replica-design` | Design tokens, components |
| `replica-build` | Build screens from recon |
| `replica-backend` | Auth, DB, Stripe, email |
| `replica-test` | Playwright E2E + manual QA |
| `replica-diff` | Feature parity + layout diff |
| `replica-entrepreneur` | Mine reviews → fixes |
| `replica-brand` | Name, trademark, palette |
| `replica-launch` | Landing, pricing, store listing |
| `replica-deploy` | Production deploy pipeline |

### CLI Tools
| Tool | Install | Purpose |
|------|---------|---------|
| `ctx7` | `npm i -g ctx7` | Fetch library docs |
| `agent-reach` | `pip install agent-reach` | Search 13+ platforms |
| `chrome-devtools` | `npm i -g chrome-devtools-mcp` | Browser CLI |
| `rea` | `npx rea-agents` | Binary analysis |

## 🔐 Secrets Management

**Never commit real API keys.** Use `.env.example` as template:

```bash
cp .env.example ~/.hermes/.env
# Edit ~/.hermes/.env with your real keys
```

Required: `CONTEXT7_API_KEY` (get from https://context7.com)

## 📚 Usage Examples

```bash
# Context7 - get React hooks docs
ctx7 library react "how to use hooks"

# Agent Reach - search GitHub
agent-reach github search "state management"

# Replica pipeline - clone an app
/replica-recon "clone Linear"
/replica-architect
/replica-design
/replica-build
# ... etc

# REA - analyze Hunt Showdown binary
npx rea-agents inspect-native-exports "path/to/GameHunt.dll"
```

## 🔄 Sync Across Machines

1. Push changes: `git add . && git commit -m "update" && git push`
2. Pull on other machine: `git pull`
3. Re-run `./scripts/install-all.sh` if new packages added

## 📖 Documentation

- Each skill has `SKILL.md` with full workflow
- Templates in `templates/` folders
- Python scripts in skill root (parity.py, imgdiff.py, sweep.py, etc.)
- Master index: `tools/README.md`

---

**Maintained by:** Zika  
**Hermes Profile:** default  
**Last Updated:** 2026-10-30