#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "[guardrails] scanning for likely secrets..."
SECRET_PATTERNS='(ghp_[A-Za-z0-9]{20,}|gho_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|AIza[0-9A-Za-z_-]{20,}|eyJ[A-Za-z0-9._-]{20,}|rt_[A-Za-z0-9._-]{20,}|[0-9]{8,}:[A-Za-z0-9_-]{20,})'

if rg -n --hidden -S "${SECRET_PATTERNS}" .; then
  echo "[guardrails] blocked: likely secret detected."
  exit 1
fi

echo "[guardrails] scanning for private key material..."
if rg -n --hidden -S -- '-----BEGIN (RSA|EC|OPENSSH|PRIVATE) KEY-----' .; then
  echo "[guardrails] blocked: private key material detected."
  exit 1
fi

echo "[guardrails] passed."
