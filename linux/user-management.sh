#!/bin/bash

# Checking existing users
cat /etc/passwd # Provide list of all users currently exist in the system
cat /etc/passwd | wc -l # Give Users count


ls -l /home # Bonus but not recommended



# Create New User
sudo useradd <username>