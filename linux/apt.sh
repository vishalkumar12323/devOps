# The APT(Advance Package Tool) Command -> A command line utility used to install, update, remove and manage software packages on Ubuntu/Debian, and other debian based Linux-distributions.

# Common Apt commands
sudo apt update # Refreshes the list of available software and versions.

sudo apt upgrade # Install the newest versions of all current apps.
sudo apt dist-upgrade

sudo apt install <package> # Download and install specific package.

sudo apt remove <package> #  Unistalls a specific program but keep config. files, use "purge" wipe config. files

sudo apt autoremove # Delete residual software libaries no longer needed.

apt search <keyword> # Looks through the store database for an app matching the term