# Resource Tuning for Phones

## Recommended baseline

- Model: `qwen2.5:0.5b`
- OpenClaw fallback models: empty
- Concurrency: 1
- Keep prompts small

## Config knobs

```bash
openclaw config set agents.defaults.bootstrapMaxChars 120
openclaw config set agents.defaults.bootstrapTotalMaxChars 400
openclaw config set agents.defaults.timeoutSeconds 900
openclaw config set agents.defaults.maxConcurrent 1
openclaw config set agents.defaults.subagents.maxConcurrent 1
```

## Observe memory and swap

In Termux:

```bash
free -h
top -b -n1 | head -n 30
```

In Ubuntu:

```bash
ps -ef | grep -E "ollama|openclaw" | grep -v grep
```

## Warm model before a chat window

```bash
cat <<'JSON' | curl -s http://127.0.0.1:11434/api/generate -H "Content-Type: application/json" --data-binary @-
{"model":"qwen2.5:0.5b","prompt":"warmup","stream":false,"keep_alive":"30m"}
JSON
```

## Switching models safely

1. Ensure current model usage has stopped.
2. Pull or prepare next model.
3. Set new default model in OpenClaw.
4. Keep only one active model during constrained-memory tests.
