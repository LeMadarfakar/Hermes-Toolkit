# Context7 — Up-to-date Code Documentation for AI Agents

## Installation
```bash
npm install -g @upstash/context7-mcp ctx7
```

## Hermes MCP Configuration
Added to `~/.hermes/config.yaml`:
```yaml
mcp_servers:
  context7:
    url: https://mcp.context7.com/mcp
    headers:
      Authorization: "Bearer ${CONTEXT7_API_KEY}"
```

## Environment Variable
Add to `~/.hermes/.env`:
```bash
CONTEXT7_API_KEY=your_api_key_here
```

## Usage
```bash
# CLI - fetch docs for any library
ctx7 library react "how to use hooks"
ctx7 docs /facebook/react "useEffect examples"

# Configure for agents
ctx7 setup --mcp

# MCP tools available after restart:
# mcp_context7_library, mcp_context7_docs
```

## Links
- GitHub: https://github.com/upstash/context7
- Website: https://context7.com
- MCP Registry: https://github.com/mcp/upstash/context7