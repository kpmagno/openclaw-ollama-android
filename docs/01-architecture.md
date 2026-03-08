# Architecture

## Runtime layers

1. Android OS
2. Termux app
3. Ubuntu inside `proot-distro`
4. Ollama server in Ubuntu
5. OpenClaw gateway in Ubuntu

## Data path

1. Message arrives (CLI test or Telegram channel).
2. OpenClaw gateway receives event.
3. OpenClaw agent calls Ollama provider (`127.0.0.1:11434`).
4. Local model generates output.
5. OpenClaw returns reply to caller/channel.

## Why this setup

- Termux gives Android-side control and boot hooks.
- Ubuntu PRoot provides a familiar Linux userspace.
- Ollama keeps model inference local.
- OpenClaw handles agent orchestration and channels.

## Constraints

- No root assumed.
- Memory is limited on phones.
- Android background management can kill services without power-policy tuning.
