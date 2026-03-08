# Troubleshooting

## Gateway says: token missing / unauthorized

Symptoms:

- `unauthorized: gateway token missing`

Fix:

1. Use the same OpenClaw profile consistently (same `HOME` and config path).
2. Re-run:

```bash
openclaw gateway status
openclaw health --json
```

3. If needed, re-run `openclaw configure` in the active profile.

## Agent fails with unknown model

Symptoms:

- `Unknown model: ollama/...`

Fix:

1. Check pulled models:

```bash
curl -s http://127.0.0.1:11434/api/tags | jq .
```

2. Set model that exists:

```bash
openclaw models set ollama/qwen2.5:0.5b
openclaw models fallbacks clear
```

## Ollama errors with `LD_PRELOAD`/libc mismatch

Symptoms:

- messages referencing `libtermux-exec-ld-preload.so` or libc version mismatch

Fix:

```bash
env -u LD_PRELOAD /usr/local/bin/ollama serve
env -u LD_PRELOAD /usr/local/bin/ollama pull qwen2.5:0.5b
```

## Telegram configured but no replies

Checklist:

1. Gateway is running.
2. Channel status shows running:

```bash
openclaw channels status --json | jq .
```

3. `allowFrom` includes your numeric Telegram user id.
4. Bot is not blocked and has chat permission.
5. Network is available for Telegram transport.

## Boot scripts do not run

Checklist:

1. Termux:Boot app installed.
2. Termux:Boot opened once manually.
3. Scripts are executable:

```bash
ls -l ~/.termux/boot
```

4. Battery restrictions removed for Termux and Termux:Boot.
