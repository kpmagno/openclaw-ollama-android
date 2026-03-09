#!/usr/bin/env bash
set -euo pipefail

# Some Android/Termux contexts inject LD_PRELOAD that breaks native ollama.
unset LD_PRELOAD || true
# Set Ollama context window to ~18k tokens.
export OLLAMA_NUM_CTX=18432

if pgrep -f "ollama serve" >/dev/null 2>&1; then
  exit 0
fi

exec /usr/local/bin/ollama serve
