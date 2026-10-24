#!/usr/bin/env bash
# Run the Captain's Deck bridge in the foreground.
# With uv, the bridge's inline metadata supplies aiohttp and cryptography.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
[[ -d static/icons ]] || { command -v uv >/dev/null && uv run --script tools/make_icons.py || python3 tools/make_icons.py; }
if command -v uv >/dev/null; then
  exec uv run --script bridge.py
fi
exec python3 bridge.py
