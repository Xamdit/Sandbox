#!/bin/bash

# Ensure we are running the script with superuser privileges
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Path to the Trash for the currently logged-in user
TRASH_PATH=~/.Trash/*

# Force remove all items from the Trash
rm -rf $TRASH_PATH

echo "Trash has been emptied!"
