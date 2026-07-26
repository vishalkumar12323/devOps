#!/bin/bash

# SCP -> Secure Copy Protocol
# Upload a file (Local -> Remote)
# scp /paht/to/local/file.txt username@remote_ip:/path/to/remote/directory

scp -i "SSH-LOOKUP" "C:/Users/me/Download/flower.jpg" ubuntu@13.233.79.108:/home/me


# Download a file (Remote -> Local)
scp ubuntu@13.233.79.108:/home/me/Downloads/access_key.pem ~/Downlaods