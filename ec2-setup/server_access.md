# Server Access and firewall strategy

This guide explains how to protect A server, prevent Access Management using Firewalls

## 1) Checking SSH Authentication logs and ufw status
```bash
sudo cat /var/log/auth.log
```

```bash
sudo ufw status
```
Allow the SSH Connection
```bash
sudo ufw allow OpenSSH
```

Enable The Firewall
```bash
sudo ufw enable
```

Verify The Status Of UFW
```bash
sudo ufw status verbose
```

## 2) Protecting SSH Authentication Using Fail2Ban
```bash
sudo cat /var/log/auth.log
```

Install fail2ban using apt
```bash
sudo apt update
```
```bash
sudo apt install fail2ban -y
```

create fail2ban local configration file instead editing main file
```bash
sudo nano /etc/fail2ban/jail.local
```

update with the below setting
```bash
[sshd]
enabled = true
bantime = 1d
maxretry = 5
findtime = 10m
```

Restart fail2ban service using systemctl
```bash
sudo systemctl restart fail2ban
```

Get fail2ban status details
```bash
sudo fail2ban-client status sshd
```