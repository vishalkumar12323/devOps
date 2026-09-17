# Create or Launch an AWS EC2 Instace with ubuntu image, Copy its public IP xx.xxx.xxx.xx
# Access EC2 ubuntu terminal via SSH
# command:
ssh -i identity-file.pem ubuntu@xx.xxx.xxx.xx

# check/find all availabel users
sudo ls -l /etc/passwd
# or
sudo ls -l /home