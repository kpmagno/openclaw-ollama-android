# Termux Base Setup

## 1) Install core packages in Termux

```bash
pkg update -y && pkg upgrade -y
pkg install -y openssh proot-distro curl jq git nodejs-lts termux-api
termux-setup-storage
```

## 2) Start SSH service in Termux

```bash
sshd
```

Termux SSH defaults:

- Port: `8022`
- User: output of `whoami` in Termux

## 3) Install Ubuntu in PRoot

```bash
proot-distro install ubuntu
proot-distro login ubuntu
```

Inside Ubuntu, verify:

```bash
whoami
uname -a
```

## 4) Create basic directories

In Termux:

```bash
mkdir -p ~/.termux/boot
```

In Ubuntu:

```bash
mkdir -p /root/.local/bin /root/.local/log
```
