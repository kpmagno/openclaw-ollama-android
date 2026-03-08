#!/data/data/com.termux/files/usr/bin/sh
set -eu

if ! pgrep -x sshd >/dev/null 2>&1; then
  sshd
fi
