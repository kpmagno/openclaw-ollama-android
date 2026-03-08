#!/usr/bin/env bash
set -euo pipefail

echo "[health] ollama version:"
curl -sf http://127.0.0.1:11434/api/version || true
echo

echo "[health] ollama loaded models:"
curl -sf http://127.0.0.1:11434/api/ps || true
echo

echo "[health] openclaw status:"
openclaw health --json || true
