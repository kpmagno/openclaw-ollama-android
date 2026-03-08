# Security Policy

## Scope

This repository is public and instructional only. It must never contain live credentials or host-identifying secrets.

## Hard rules

1. Never commit:
   - Bot tokens
   - API keys
   - OAuth access/refresh tokens
   - Private SSH keys
   - Real host IPs tied to personal infrastructure
2. Use placeholders in all examples.
3. Treat all incoming pull requests as untrusted until reviewed.
4. Keep `.gitignore` current for secret-bearing file patterns.

## Responsible disclosure

If you find a secret leak in this repository:

1. Do not post it publicly.
2. Open a private security report through GitHub Security Advisories, or open an issue without the secret value.
3. Include file path and commit hash only.

## Incident response baseline

If secret leakage occurs:

1. Remove secret from history (filter-repo/BFG).
2. Rotate all affected credentials immediately.
3. Invalidate old tokens and keys.
4. Publish a remediation summary without exposing sensitive values.
