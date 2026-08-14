#!/bin/bash

groups # shows all available groups on the system
groups <username> # shows all groups for a specific user

cat /etc/group # shows all groups and their members


sudo groupadd <groupname> # creates a new group
sudo groupdel <groupname> # deletes a group