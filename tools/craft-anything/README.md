# Craft Anything — Open-Source Clean-Room Engine in Rust

## Overview
Craft Anything is an open-source engine for understanding how software works and building your own versions. It studies target applications (websites, apps, games) with real inspection tools, has a coding agent build a new project, checks results against the original, and refines.

## Installation
```bash
# Requires Rust 1.97+
git clone https://github.com/storytold/craft-anything
cd craft-anything
cargo run --release -p craft-anything    # Desktop app
cargo install --path apps/craft-anything-cli  # CLI
craft-anything-cli doctor
```

## Key Features
- **Study**: Inspect any software with real tools (screenshots, visible text, layout, colors, fonts)
- **Build**: Coding agent (Claude Code, Codex, etc.) builds new project in your chosen stack
- **Check**: Compare build with original at 3 screen widths; game rebuilds in Unity/Unreal/Godot
- **Refine**: Ask for changes, it iterates
- **Clean room mode**: Works from observable behavior only (no source code reading)
- **Deep mode**: Full code analysis with Ghidra, decoders, disassembler

## Components
| Component | Purpose |
|-----------|---------|
| Desktop App (egui) | Visual interface: Simple & Advanced modes |
| CLI (`craft-anything-cli`) | Every tool as subcommand, MCP server, rebuild commands |
| MCP Server | 300+ tools exposed to any MCP client |
| Engine (Rust) | 320 tools for native, .NET, Java, Android, JS, firmware, packets |

## Documentation
- **Get started**: [README.md](https://github.com/storytold/craft-anything)
- **Tools reference**: [docs/tools.md](https://github.com/storytold/craft-anything/blob/main/docs/tools.md)
- **Status/Roadmap**: [docs/STATUS.md](https://github.com/storytold/craft-anything/blob/main/docs/STATUS.md)
- **Claude Code setup**: [docs/claude-code.md](https://github.com/storytold/craft-anything/blob/main/docs/claude-code.md)

## Repo
This is a local copy of the source. Full repo: https://github.com/storytold/craft-anything

## Requirements
- Rust 1.97+ (`rustup update`)
- Linux: `libxkbcommon-dev libwayland-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libgtk-3-dev`
- Coding agent: Claude Code (primary), Codex, GitHub Copilot, others via ACP