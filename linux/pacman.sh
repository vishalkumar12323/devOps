
# Refresh the list of available packages and softwares
sudo pacman -Syu

# Installing packages
sudo pacman -S <package>
sudo pacman -S htop tmux python-pygame # installing multiple packages.

# Remove packages
sudo pacman -R <package>


# Searching packages using keywords
pacman -Ss <keyword>
pacman -Ss pygame


# find orphine packages or residual packages and libraries
pacman -Qdt