# OpenClaw Model and Telegram Setup

Run in Ubuntu unless noted.

## 1) Initialize OpenClaw

```bash
openclaw configure
```

Choose local gateway mode and complete the wizard.

## 2) Set Ollama model as default

```bash
openclaw models set ollama/qwen2.5:0.5b
openclaw models fallbacks clear
openclaw models status --json | jq .
```

## 3) Low-resource defaults (recommended on phones)

```bash
openclaw config set agents.defaults.bootstrapMaxChars 120
openclaw config set agents.defaults.bootstrapTotalMaxChars 400
openclaw config set agents.defaults.timeoutSeconds 900
openclaw config set agents.defaults.maxConcurrent 1
openclaw config set agents.defaults.subagents.maxConcurrent 1
```

## 4) Start gateway

```bash
OPENCLAW_DISABLE_BONJOUR=1 openclaw gateway run
```

## 5) Local smoke test (no Telegram needed)

```bash
openclaw agent --agent main --message "Reply with one word: PONG" --json
```

## 6) Optional Telegram channel

Add Telegram account:

```bash
openclaw channels add --channel telegram --token "<YOUR_BOT_TOKEN_OR_PAIRING_CODE>"
```

Restrict inbound senders:

```bash
openclaw config set channels.telegram.allowFrom "[<YOUR_TELEGRAM_NUMERIC_USER_ID>]"
```

Status check:

```bash
openclaw channels status --json | jq .
```

## 7) Important note on "offline"

- Ollama inference can be fully local.
- Telegram transport still requires network access.
