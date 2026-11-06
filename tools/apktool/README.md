# Apktool — Android APK Reverse Engineering Tool

## Overview
Apktool is a tool for reverse engineering Android APK files. It can decode resources to nearly original form and rebuild them after modifications.

## Version
**3.0.3** (Latest, July 2026)

## Files
| File | Description |
|------|-------------|
| `apktool.jar` | Main executable (15.5 MB) |
| `apktool.bat` | Windows wrapper script |

## Requirements
- **Java JRE/JDK 8+** (tested with JDK 21)
- Install: `winget install EclipseAdoptium.Temurin.21.JDK` or download from [adoptium.net](https://adoptium.net)

## Installation
```powershell
# Place apktool.jar and apktool.bat in same folder
# Add folder to PATH, or run via full path
```

## Usage

### Decompile APK
```bash
apktool.bat d app.apk -o output_folder
```

### Rebuild APK
```bash
apktool.bat b decoded_folder -o modified.apk
```

### Install Framework (for system apps)
```bash
apktool.bat if framework.apk
```

### Options
| Flag | Description |
|------|-------------|
| `-o, --output` | Output directory/file |
| `-f, --force` | Force overwrite |
| `-r, --no-res` | Don't decode resources |
| `-s, --no-src` | Don't decode sources (smali) |
| `--frame-path` | Custom framework path |
| `--aapt2` | Use aapt2 (default) |

## Output Structure
```
decoded_apk/
├── AndroidManifest.xml    # Readable XML manifest
├── res/                   # Resources (layouts, drawables, values, etc.)
├── smali/                 # Smali code (human-readable Dalvik bytecode)
├── assets/                # Raw assets
├── original/              # Original files (META-INF, etc.)
├── unknown/               # Unknown files
└── apktool.yml           # Apktool metadata
```

## Common Workflows

### Modifying an App
```bash
# 1. Decompile
apktool.bat d MyApp.apk -o MyApp_mod

# 2. Edit smali code in MyApp_mod/smali/
#    Edit resources in MyApp_mod/res/

# 3. Rebuild
apktool.bat b MyApp_mod -o MyApp_modified.apk

# 4. Sign (REQUIRED for installation)
apksigner sign --ks mykey.keystore MyApp_modified.apk
# OR
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore mykey.keystore MyApp_modified.apk alias
```

### Install Framework for System Apps
```bash
apktool.bat if /path/to/framework.apk
apktool.bat d system_app.apk -o system_app_decoded
```

## Key Features
- **Resource decoding**: Binary XML → readable XML
- **Smali disassembly**: Dalvik bytecode → smali assembly
- **AAPT2 integration**: Uses Android's latest resource compiler
- **Framework support**: Handles vendor/framework APKs
- **Cross-platform**: Windows, Linux, macOS

## Security Note
Apktool 3.0.2 fixed CVE-2026-39973 (path traversal). Always use 3.0.2+.

## Links
- **Website**: https://apktool.org
- **GitHub**: https://github.com/iBotPeaches/Apktool
- **Releases**: https://github.com/iBotPeaches/Apktool/releases
- **Documentation**: https://apktool.org/docs/

## Version
**3.0.3** (July 2026) — Last of 3.0 line, next requires JDK 17