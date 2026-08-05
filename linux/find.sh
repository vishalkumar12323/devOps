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
