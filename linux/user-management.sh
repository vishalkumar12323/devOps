#!/bin/bash

# Checking existing users
cat /etc/passwd # Provide list of all users currently exist in the system
cat /etc/passwd | wc -l # Give Users count


ls -l /home # Bonus but not recommended



# Create New User
sudo useradd guest

cat /etc/passwd
# usrname  usrId        path      shell
# guest:x:1001:1002::/home/guest:/bin/sh


# Delete User
sudo userdel guest


# Create user with home directory
sudo useradd -m smith # create user smith and add to the /home dir.

# Remove user and also remove from the /home dir.
sudo userdel -r smith