# Chrome DevTools MCP — Browser Automation & Debugging for AI Agents

## Installation
```bash
npm install -g chrome-devtools-mcp@latest
```

## Hermes MCP Configuration
Added to `~/.hermes/config.yaml`:
```yaml
mcp_servers:
  chrome-devtools:
    command: npx
    args: ["chrome-devtools-mcp@latest"]
```

## Optional Flags
```yaml
mcp_servers:
  chrome-devtools:
    command: npx
    args: ["chrome-devtools-mcp@latest", "--categoryExtensions", "--memoryDebugging"]
```

## Usage
```bash
# CLI - control browser from terminal
chrome-devtools --help

# MCP tools available after restart:
# Navigation: navigate, go_back, go_forward, reload
# Input: click, type, select, scroll, hover, drag_and_drop, press_key
# Screenshots: screenshot
# Console: get_console_messages, wait_for_console_message
# Network: get_network_requests, wait_for_network_request
# Performance: performance_start_trace, performance_stop_trace, performance_analyze_insight
# DOM: get_dom, query_selector, wait_for_selector
# Extensions: install_extension, list_extensions, remove_extension
# WebMCP: execute_webmcp_tool, execute_3p_developer_tool
```

## Links
- GitHub: https://github.com/ChromeDevTools/chrome-devtools-mcp
- Docs: https://developer.chrome.com/docs/devtools/agents/get-started
- Tool Reference: https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/tool-reference.md
- Skills: https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/skills/chrome-devtools/SKILL.md