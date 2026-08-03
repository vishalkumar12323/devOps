# check hostname or server of computer
hostname
#or
echo $HOSTNAME

# To locat hostname file
cat /etc/hostname # print the hostname

# Provide hostname and some additional computer info.
hostnamectl

# Change the hostname
hostnamectl set-hostname my-laptop
#or
sudo nano /etc/hostname # Edit menuallys