# Autostart and Power Settings

## 1) Termux:Boot script deployment

Copy scripts from this repo into Termux and Ubuntu.

In Termux:

```bash
mkdir -p ~/.termux/boot
cp /path/to/repo/scripts/termux-boot/*.sh ~/.termux/boot/
chmod 700 ~/.termux/boot/*.sh
```

In Ubuntu:

```bash
mkdir -p /root/.local/bin
cp /path/to/repo/scripts/ubuntu/*.sh /root/.local/bin/
chmod 700 /root/.local/bin/*.sh
```

Open the `Termux:Boot` app once after install.

## 2) Recommended Android app settings

For both `Termux` and `Termux:Boot`:

1. Battery usage: set to `Unrestricted`.
2. Autostart: enable.
3. Background activity: allow.
4. Recent apps: lock Termux if your ROM supports app lock.

## 3) Verify boot behavior

After reboot:

1. Open Termux.
2. Check boot logs:

```bash
tail -n 200 ~/.termux/boot/openclaw-stack.log
```

3. Check Ubuntu services:

```bash
proot-distro login ubuntu -- bash -lc 'ps -ef | grep -E "ollama serve|openclaw-gateway" | grep -v grep'
```

## 4) Keep one model loaded at a time

Check loaded model:

```bash
curl -s http://127.0.0.1:11434/api/ps | jq .
```

Unload naturally by idling or switch models explicitly between tests.
