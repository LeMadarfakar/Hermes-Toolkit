# Tools Index — AI Agent Toolkit in Obsidian Vault

## Overview
All AI agent tools, skills, and configurations documented in this vault at `D:/brain/tools/`.

## Installed Tools

### 1. Replica Skills (App Cloning Pipeline)
**Location:** `tools/replica-skills/` (11 skills)
**Category:** `app-cloning`

| Skill | Purpose | Next Step |
|-------|---------|-----------|
| `replica-recon` | Reverse-engineer app → screens, flows, data model, feature matrix | `/replica-architect` |
| `replica-architect` | Plan stack, DB schema, API from recon | `/replica-design` |
| `replica-design` | Design tokens, components, WCAG contrast | `/replica-build` |
| `replica-build` | Build screens: shell → vertical slice → all screens | `/replica-backend` |
| `replica-backend` | Auth, DB, Stripe, email, jobs, security checklist | `/replica-test` |
| `replica-test` | Playwright E2E + manual, bug reports (S1-S4) | `/replica-diff` |
| `replica-diff` | Feature parity score + layout diff (ignores colour) | `/replica-entrepreneur` |
| `replica-entrepreneur` | Mine user reviews → fixes, positioning angle | `/replica-brand` |
| `replica-brand` | Name, trademark checks, palette, logo brief, voice, sweep | `/replica-launch` |
| `replica-launch` | Landing page, pricing, App Store/Play listing lint | `/replica-deploy` |
| `replica-deploy` | Preflight → production DB, DNS, Stripe live, monitoring | — |

**Workflow:** Chain them: `/replica-recon` → `/replica-architect` → ... → `/replica-deploy`

### 2. Agent Reach — Multi-Platform Internet Access
**Location:** `tools/agent-reach/`
**CLI:** `agent-reach` (installed globally via pip)

| Channel | Level | Actions |
|---------|-------|---------|
| github | default | search, read (repos, issues, PRs) |
| youtube | default | read, search, subtitle, transcribe |
| bilibili | default | search, read, hot, subtitle |
| v2ex | default | hot, node, read, user |
| web | default | search, read (Exa/Jina) |
| reddit | optional | search, read, subreddit |
| twitter | experimental | search, profile, tweets, thread |
| xiaohongshu | optional | search, read, comments |
| linkedin | optional | jobs, read |
| boss | optional | search, read |
| xueqiu | optional | quote, search, hot_posts, hot_stocks |
| xiaoyuzhou | optional | transcribe |
| facebook | experimental | search, profile |
| instagram | experimental | search, profile, posts |

**Usage:**
```bash
agent-reach channels                    # list all
agent-reach github search "react"       # search repos
agent-reach youtube subtitle <url>      # get subtitles
agent-reach login reddit                # enable optional channel
```

**Data:** `~/.agent-reach/`

### 3. Context7 — Up-to-date Code Documentation
**Location:** `tools/context7/`
**Packages:** `@upstash/context7-mcp`, `ctx7` (global npm)

**Hermes MCP:** Configured at `mcp_servers.context7` (url + Bearer token)

**Usage:**
```bash
ctx7 library react "hooks"
ctx7 docs /facebook/react "useEffect"
```

**API Key:** Add `CONTEXT7_API_KEY` to `~/.hermes/.env`

### 4. Chrome DevTools MCP — Browser Automation & Debugging
**Location:** `tools/chrome-devtools-mcp/`
**Package:** `chrome-devtools-mcp@latest` (global npm)

**Hermes MCP:** Configured at `mcp_servers.chrome-devtools` (npx command)

**Tools:** navigate, click, type, screenshot, console, network, performance, DOM, extensions, WebMCP

### 5. REA (Reverse Engineer Anything)
**Location:** `tools/rea/` (cloned from `D:/brain/rea`)
**MCP:** `npx rea-agents setup` registers with Hermes

**Capabilities:** Native binaries (Ghidra/IDA/Hopper), JS/Electron, Android, firmware, browser, process tracing.

### 6. Hunt Showdown Clone Plan
**Location:** `tools/rea/HUNT_CLONE_PLAN.md` (created during analysis)

## Hermes Configuration
All MCP servers registered in `~/.hermes/config.yaml`:
- `context7` — docs lookup
- `chrome-devtools` — browser automation
- `rea` — (via `npx rea-agents setup`)

## Quick Start Commands
```bash
# Replica: clone an app
/replica-recon "clone Linear" → /replica-architect → ...

# Agent Reach: search internet
agent-reach github search "state management"

# Context7: get library docs
ctx7 library zod "schema validation"

# Chrome DevTools: debug web app
# (MCP tools auto-available after restart)
```

## Directory Structure
```
D:/brain/tools/
├── replica-skills/          # 11 Hermes skills (SKILL.md + templates + scripts)
├── agent-reach/             # Full Agent Reach source
├── context7/                # README + config docs
├── chrome-devtools-mcp/     # README + config docs
├── rea/                     # README + config docs
└── README.md                # This file
```