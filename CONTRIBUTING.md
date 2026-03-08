# Contributing

## Non-negotiable constraints

1. No secrets in commits, issues, PRs, or screenshots.
2. No personal infrastructure identifiers (real hostnames, private IP maps, personal account IDs).
3. Keep examples generic and reusable.
4. Keep instructions reproducible on clean Android + Termux setups.

## Pull request standards

1. One logical change per PR.
2. Update docs when behavior changes.
3. Include a validation section in PR description:
   - What was tested
   - On what Android/Termux environment
   - Known limitations
4. PR must pass repository checks before merge.

## Commit hygiene

1. Use clear commit messages.
2. Do not rewrite public history on `main`.
3. Prefer squash merge.

## Content style

1. Use placeholders like `<PHONE_IP>`, `<TERMUX_USER>`, `<BOT_TOKEN>`.
2. Keep commands copy-paste safe.
3. Mark high-risk operations clearly.
