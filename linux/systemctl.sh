
# SYSTEMCTL IS USED TO MANAGE AND CONTROL SYSTEM SERVICES AND UNITS IN LINUX SYSTEMS THAT USE SYSTEMD INIT SYSTEMS.

# SYNTAX
SYSTEMCTL [command] [unit/service]



systemctl list-unit-files --type=service

sudo apt install apache2

systemctl status apache2

sudo systemctl enable apache2
sudo systemctl disable apache2


sudo systemctl start apache2
sudo systemctl stop apache2

sudo systemctl restart apache2
sudo systemctl reload apache2

# Enable the Apache2 Service and Start.
sudo systemctl enable --now apache2


sudo apt install syncthing #Syncthing - Open Source Continuous File Synchronization
systemctl status syncthing@vishal
