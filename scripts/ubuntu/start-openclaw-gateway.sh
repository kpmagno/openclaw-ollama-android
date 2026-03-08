#!/usr/bin/env bash
set -euo pipefail

if pgrep -f "openclaw-gateway" >/dev/null 2>&1; then
  exit 0
fi

export OPENCLAW_DISABLE_BONJOUR=1
exec openclaw gateway run
