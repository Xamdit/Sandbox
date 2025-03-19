#!/bin/bash

# Define email for SSH key
echo "Enter the email associated with your GitLab account:"
read email

# Define SSH key path
default_key_path="$HOME/.ssh/gitlab_rsa"
echo "Enter the file path for the SSH key (default: $default_key_path):"
read key_path
key_path=${key_path:-$default_key_path}

# Generate SSH key
if [ -f "$key_path" ]; then
  echo "SSH key already exists at $key_path. Do you want to overwrite it? (yes/no)"
  read overwrite
  if [[ "$overwrite" != "yes" ]]; then
    echo "Exiting without creating a new SSH key."
    exit 0
  fi
fi

ssh-keygen -t rsa -b 4096 -C "$email" -f "$key_path" -N ""

# Add SSH key to the ssh-agent
eval "$(ssh-agent -s)"
ssh-add "$key_path"

# Display the public key
echo "Your SSH key has been created and added to the ssh-agent."
echo "Public key:"
cat "$key_path.pub"

# Instructions to add the key to GitLab
echo ""
echo "Add this public key to your GitLab account:"
echo "1. Copy the above public key."
echo "2. Go to GitLab -> User Settings -> SSH Keys."
echo "3. Paste the key and save."
