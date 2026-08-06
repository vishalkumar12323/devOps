#!/bin/bash

# Find command is a built in utility to search for files and directories within a directory hierarchy.

find [starting_point] [options] [expression]

# Examples

#/**
    # Search by name
    find . -name "index.html"

    # Case-Insensitive match
    find . -iname "readme.txt"

    # Using wild card
    find /home/user -name "*.pdf"
# **/


#/** Search by type

    # Find files only
    find . -type f -name "config*"

    # Find directory only
    find . -type d "/etc"

    # Find sybolic links
    find . -type l
# **/


# Find the all logs files in /var/log dir and make them all empty
find /var/log -type f -name "*.log" -exec truncate -s 0 {} +

# find -> utility command
# /var/log -> searching directory
# -type f -> search object type file
# -name "*.log" -> all file that ext. ended with .log
# -exec -> The pipe command redirect find command output to truncate command
# truncate -> utility command
# -s -> option refering to file size
# 0 -> size 0 (zero)
# {} -> find command result replaces the breakates
# + -> end sign