#!/bin/bash

# Simple macOS Cleaner Script mimicking some CCleaner functionalities

# Function to print a separator
separator() {
  echo "-----------------------------------------------"
}

# Function to clear user cache
clear_user_cache() {
  echo "Clearing user cache..."
  rm -rf ~/Library/Caches/*
}

# Function to clear system logs
clear_system_logs() {
  echo "Clearing system logs..."
  sudo rm -rf /var/log/*
  sudo rm -rf /private/var/log/*
}

# Function to clear temporary files
clear_tmp() {
  echo "Clearing temporary files..."
  rm -rf /tmp/*
  sudo rm -rf /private/tmp/*
}

# Function to empty the Trash
empty_trash() {
  echo "Emptying the Trash..."
  rm -rf ~/.Trash/*
}

# Main execution starts here

echo "macOS Cleaner Script (Mimicking some CCleaner functionalities)"
separator

read -p "Do you want to clear user cache? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  clear_user_cache
fi
separator

read -p "Do you want to clear system logs? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  clear_system_logs
fi
separator

read -p "Do you want to clear temporary files? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  clear_tmp
fi
separator

read -p "Do you want to empty the Trash? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  empty_trash
fi
separator

echo "Cleaning complete!"
