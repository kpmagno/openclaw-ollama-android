# Ubuntu: Install Ollama and OpenClaw

Run these in Ubuntu (`proot-distro login ubuntu`).

## 1) Base packages

```bash
apt-get update
apt-get install -y curl ca-certificates jq gnupg
```

## 2) Node.js 22+ (required by current OpenClaw CLI)

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs
node -v
npm -v
```

## 3) Install OpenClaw

```bash
npm install -g openclaw
openclaw --version
```

## 4) Install Ollama

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Start Ollama server:

```bash
env -u LD_PRELOAD /usr/local/bin/ollama serve
```

If you want it in background:

```bash
nohup env -u LD_PRELOAD /usr/local/bin/ollama serve >/root/.local/log/ollama.log 2>&1 &
```

## 5) Pull a small starter model

```bash
env -u LD_PRELOAD /usr/local/bin/ollama pull qwen2.5:0.5b
curl -s http://127.0.0.1:11434/api/tags | jq .
```
