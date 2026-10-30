# REA (Reverse Engineer Anything) — Binary & App Analysis Toolkit

## Location
Cloned at: `D:/brain/rea`

## Installation
```bash
cd D:/brain/rea
npm install
npm run build
```

## Hermes MCP Configuration
REA registers as an MCP server via:
```bash
npx rea-agents setup
```

## Usage
```bash
# Terminal
npx rea-agents analyze-javascript-application /path/to/app --json
npx rea-agents inspect-native-exports /path/to/binary.dll

# MCP tools (after setup + restart)
# rea.analyze, rea.decompile, rea.inspect, rea.trace, etc.
```

## Capabilities
- Native binaries: Ghidra, Hopper, IDA, Cutter, Radare2, objdump
- JavaScript/Electron apps: static analysis, module graphs
- Android: APK, JADX, Frida
- Firmware: ELF, PE, WASM, EVM
- Browser/Electron: CDP inspection, network capture
- Process tracing: pwndbg, lldb, Frida

## Links
- GitHub: https://github.com/morluto/rea
- Website: https://rea.tools
- Docs: https://rea.tools/guides/