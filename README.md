# OpenClaw + Ollama on Android (Termux) Playbook

Public playbook for running OpenClaw on an Android phone with local Ollama inference.

## What this gives you

- OpenClaw agent runtime on Android (via Termux + Ubuntu PRoot)
- Ollama running locally on the phone
- Local model inference for agent replies
- Optional Telegram channel integration
- Optional SSH access into Termux
- Boot-time auto-start scripts

## Scope and reality check

- Inference can be local/offline.
- Telegram itself still needs network access to Telegram servers.
- On lower-power phones, response latency can be high.

## Quick start

1. Install Termux from F-Droid and complete the base setup.
2. Install Ubuntu in Termux with `proot-distro`.
3. In Ubuntu, install Ollama and OpenClaw.
4. Pull a small model (`qwen2.5:0.5b` is a safe baseline).
5. Configure OpenClaw to use Ollama and clear cloud fallbacks.
6. Add boot scripts for `sshd`, Ollama, and OpenClaw gateway.
7. Disable battery restrictions for Termux and Termux:Boot.
8. Test with `openclaw agent` first, then optional Telegram.

Detailed steps are in:

- [docs/01-architecture.md](docs/01-architecture.md)
- [docs/02-prerequisites.md](docs/02-prerequisites.md)
- [docs/03-termux-base-setup.md](docs/03-termux-base-setup.md)
- [docs/04-ubuntu-ollama-openclaw.md](docs/04-ubuntu-ollama-openclaw.md)
- [docs/05-openclaw-model-and-telegram.md](docs/05-openclaw-model-and-telegram.md)
- [docs/06-autostart-and-power.md](docs/06-autostart-and-power.md)
- [docs/07-ssh-into-android.md](docs/07-ssh-into-android.md)
- [docs/08-troubleshooting.md](docs/08-troubleshooting.md)
- [docs/09-resource-tuning.md](docs/09-resource-tuning.md)

## Reference scripts

- Termux boot scripts: [`scripts/termux-boot`](scripts/termux-boot)
- Ubuntu service scripts: [`scripts/ubuntu`](scripts/ubuntu)
- Local guardrails scan: [`scripts/check-guardrails.sh`](scripts/check-guardrails.sh)
- OpenClaw config template: [`templates/openclaw.json.example`](templates/openclaw.json.example)

## Security baseline

- Never publish bot tokens, OAuth tokens, or API keys.
- Use SSH keys, not passwords.
- Keep `channels.telegram.allowFrom` restricted to known numeric IDs.
- Keep OpenClaw model fallbacks empty for local-only inference paths.
- Run `./scripts/check-guardrails.sh` before every push.

## Credits

Prepared by BeeHive contributors and Codex GPT-5.3 High.
