# EC2 Ubuntu Setup Guide

This guide explains the basic Ubuntu EC2 setup, SSH access, user creation, and a reusable SSH alias for connecting to the server.

## 1) Launch the EC2 instance

- Launch an EC2 instance using an Ubuntu AMI.
- Copy the instance public IP address, for example:
  - `<ec2_public_ip>`

## 2) Connect to the EC2 instance with SSH

Use the default Ubuntu user for a fresh Ubuntu AMI:

```bash
ssh -i your-key.pem ubuntu@<ec2_public_ip>
```

If you created a custom user, connect using that user instead:

```bash
ssh -i your-key.pem username@<ec2_public_ip>
```

## 3) Check existing users on the server

To view system users:

```bash
cut -d: -f1 /etc/passwd
```

To inspect home directories:

```bash
ls -l /home
```

On a standard Ubuntu EC2 instance, the default user is usually `ubuntu`.

## 4) Create a new user and grant sudo access

Create a user and create a home directory:

```bash
sudo useradd -m username
```

Set a password for the new user:

```bash
sudo passwd username
```

Add the user to the `sudo` group:

```bash
sudo usermod -aG sudo username
```

Now you can log in as the new user:

```bash
ssh -i your-key.pem username@<ec2_public_ip>
```

## 5) Add a shortcut for SSH connections

Edit the SSH config file on your local machine:

```bash
nano ~/.ssh/config
```

Add the following:

```sshconfig
Host my-ec2-server
    HostName <ec2_public_ip>
    User vishal
    IdentityFile /path/to/your-key.pem
    IdentitiesOnly yes
```

Then connect using the alias:

```bash
ssh my-ec2-server
```

## 6) Common notes

- For Ubuntu EC2 images, the default admin user is usually `ubuntu`.
- Use `sudo` for root-level actions.
- Keep the private key file secure and never share it publicly.
- If you prefer to use the default `ubuntu` user, replace `vishal` with `ubuntu` in the SSH config examples above.

## 7) Quick reference

```bash
ssh -i your-key.pem ubuntu@<ec2_public_ip>
ssh -i your-key.pem vishal@<ec2_public_ip>
ssh my-ec2-server
```
