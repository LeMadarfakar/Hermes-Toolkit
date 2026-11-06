# NX2Apple — Play Switch Games on iPhone/iPad

## Overview
NX2Apple is a toolchain for building Nintendo Switch games as iOS apps. It unpacks your own game dumps (NSPs), rewrites the code for Apple Silicon, translates shaders to Metal, and packages a slim IPA plus a sharded RomFS archive that installs on iOS.

## Source
- **Upstream**: [seedds/nxnative](https://github.com/seedds/nxnative) (MIT)
- **This fork**: [LNPANDY/NX2Apple](https://github.com/LNPANDY/NX2Apple) — adds GUI, RomFS sharding, interrupted build resume, upstream sync

## Key Features
- **NS Port Builder** — macOS GUI app (Swift) for end-to-end builds
- **RomFSARC** — shards large RomFS (e.g., 300K files) into ~100 shards for iOS install
- **Interrupted build resume** — extraction, DLC, rewrite, shader compilation cached
- **Daily upstream sync** — GitHub Actions re-applies fork features to upstream
- **58 game profiles** — 3 verified end-to-end, 29 playable upstream

## Requirements
- macOS (Xcode + iOS SDK)
- Python 3.9+, Homebrew tools
- `prod.keys` (dumped from your own console)
- Game NSPs (your own dumps)

## Quick Start
```bash
git clone https://github.com/LNPANDY/NX2Apple.git
cd NX2Apple
brew install xcodegen zstd spirv-cross
brew install --cask dotnet-sdk
python3 -m pip install lz4 capstone fonttools backports.zstd
```

## Key Scripts
| Script | Purpose |
|--------|---------|
| `scripts/build_ipa_from_nsp.py` | Build IPA from NSP |
| `dm/tools/romfs_arc.py` | Pack/verify RomFS shards |
| `dm/ios/tools/build_ipa.sh` | Rebuild IPA |
| `frontend/NS Port Builder.app` | macOS GUI |

## Documentation
- **README**: https://github.com/LNPANDY/NX2Apple
- **Releases**: https://github.com/LNPANDY/NX2Apple/releases
- **Frontend**: https://github.com/LNPANDY/NX2Apple/tree/main/frontend

## Legal
- Personal use only — your own game dumps + your own keys
- No Nintendo code/keys distributed
- Not affiliated with Nintendo