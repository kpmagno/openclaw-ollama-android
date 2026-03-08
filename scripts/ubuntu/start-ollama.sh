#!/usr/bin/env bash
set -euo pipefail

# Some Android/Termux contexts inject LD_PRELOAD that breaks native ollama.
unset LD_PRELOAD || true

if pgrep -f "ollama serve" >/dev/null 2>&1; then
  exit 0
fi

exec /usr/local/bin/ollama serve
