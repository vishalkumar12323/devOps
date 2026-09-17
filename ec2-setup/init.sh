# Create or Launch an AWS EC2 Instace with ubuntu image, Copy its public IP xx.xxx.xxx.xx
# Access EC2 ubuntu terminal via SSH
# command:
ssh -i identity-file.pem ubuntu@xx.xxx.xxx.xx

# check/find all availabel users
sudo ls -l /etc/passwd
# or
sudo ls -l /home

# By Default A non root user aleady created "ubuntu", but we can see how to create new user with password and assign sudo permissions
# command for create new user:
sudo useradd -m vishal # -m for add the user to /home dir.  

# command for create new password for user vishal
sudo passwd vishal

# Assign the sudo permissions
sudo usermod -aG sudo vishal

# connect to the ec2 with using ssh
ssh -i your-identity-file.pem vishal@<ec2_public_ip>

# shortcut method for connecting to any remote server using ssh
# edit your local machine .ssh/config file:
nano ~/.ssh/config

# with the below content:
Host my-ec2-server
    Hostname <ec2_public_ip>
    User vishal or ubuntu
    IdentityFile <path_to_your_pem_file>
    IdnetitiesOnly yes

# command for connecting to server
ssh my-ec2-server
