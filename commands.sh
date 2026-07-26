#!/bin/bash

# SCP -> Secure Copy Protocol
# Upload a file (Local -> Remote)
# scp /paht/to/local/file.txt username@remote_ip:/path/to/remote/directory

scp -i "SSH-LOOKUP" "C:/Users/me/Download/flower.jpg" ubuntu@110.0.1.230:/home/me