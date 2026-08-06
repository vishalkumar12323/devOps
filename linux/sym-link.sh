
# Command
ln -s /var/log/server.log /home/vishal/server.log

# ln -> utility-command
# -s -> soft sym-link
# /var/log/server.log -> file path that you want to make sym-link
# /home/vishal/server.log -> path where the sym-link will be create


ln /var/log/server.log ~/new_server.log # This is a hard link, means it is duplicate copy of original file, both the original file and newly created sym-link file has same inode number. 

