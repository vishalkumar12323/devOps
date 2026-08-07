
# SYSTEMCTL IS USED TO MANAGE AND CONTROL SYSTEM SERVICES AND UNITS IN LINUX SYSTEMS THAT USE SYSTEMD INIT SYSTEMS.

# SYNTAX
SYSTEMCTL [command] [unit/service]


# Common command and Examples

# List all services
systemctl list-unit-files --type=service

sudo apt install apache2

# Check status for particular service/unit
systemctl status apache2

# Enable a service
sudo systemctl enable apache2

# Disable a service
sudo systemctl disable apache2

# Start a service
sudo systemctl start apache2

# Stop a service
sudo systemctl stop apache2

# Restart a service
sudo systemctl restart apache2

# Reload service configs without restarting
sudo systemctl reload apache2

# Enable the Apache2 Service and Start.
sudo systemctl enable --now apache2


sudo apt install syncthing #Syncthing - Open Source Continuous File Synchronization
systemctl status syncthing@vishal


# Masking a service to prevent it from start
systemctl mask <service-name>

# Unmask a service to allow it to start
systemctl unmask <service-name>
