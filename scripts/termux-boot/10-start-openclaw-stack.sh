#!/data/data/com.termux/files/usr/bin/sh
set -eu

LOG="$HOME/.termux/boot/openclaw-stack.log"
mkdir -p "$(dirname "$LOG")"

{
  date
  echo "[boot] starting openclaw stack"

  # Ensure Termux SSH is alive first.
  if ! pgrep -x sshd >/dev/null 2>&1; then
    echo "[boot] sshd not running, starting"
    sshd
  fi

  # Start Ubuntu-side services.
  proot-distro login ubuntu -- bash -lc '
    set -eu
    mkdir -p /root/.local/bin /root/.local/log

    if [ -x /root/.local/bin/start-ollama.sh ]; then
      nohup /root/.local/bin/start-ollama.sh >>/root/.local/log/ollama.log 2>&1 &
      echo "[boot] requested ollama start"
    else
      echo "[boot] missing /root/.local/bin/start-ollama.sh"
    fi

    if [ -x /root/.local/bin/start-openclaw-gateway.sh ]; then
      nohup /root/.local/bin/start-openclaw-gateway.sh >>/root/.local/log/openclaw-gateway.log 2>&1 &
      echo "[boot] requested gateway start"
    else
      echo "[boot] missing /root/.local/bin/start-openclaw-gateway.sh"
    fi
  '
} >>"$LOG" 2>&1
