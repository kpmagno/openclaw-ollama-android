# SSH Into Android (Optional but Recommended)

## 1) Start SSH in Termux

```bash
sshd
```

Default endpoint:

- Host: `<PHONE_IP>`
- Port: `8022`
- User: output of `whoami` in Termux

Find phone IP:

```bash
ip -4 addr show wlan0 | awk '/inet /{print $2}'
```

## 2) Use SSH key auth

On your client machine:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/android_termux_ed25519
ssh-copy-id -i ~/.ssh/android_termux_ed25519.pub -p 8022 <TERMUX_USER>@<PHONE_IP>
```

If `ssh-copy-id` is unavailable, append manually to `~/.ssh/authorized_keys` on phone.

## 3) Test

```bash
ssh -i ~/.ssh/android_termux_ed25519 -p 8022 <TERMUX_USER>@<PHONE_IP> 'echo ok && whoami'
```

## 4) Optional hardening

Edit Termux SSH config (path may vary by package version):

```bash
grep -nE 'PasswordAuthentication|PubkeyAuthentication' /data/data/com.termux/files/usr/etc/ssh/sshd_config
```

Set:

- `PubkeyAuthentication yes`
- `PasswordAuthentication no`

Then restart:

```bash
pkill sshd
sshd
```

## 5) USB fallback (ADB forward)

If Wi-Fi path is unstable:

```bash
adb forward tcp:10022 tcp:8022
ssh -p 10022 <TERMUX_USER>@127.0.0.1
```
