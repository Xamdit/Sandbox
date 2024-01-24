#!/bin/bash

# Install Nginx using Homebrew
echo "Installing Nginx..."
brew install nginx

# Edit Nginx configuration
NGINX_CONFIG="/usr/local/etc/nginx/nginx.conf"
echo "Configuring Nginx..."

# Backup the original nginx.conf
cp $NGINX_CONFIG "$NGINX_CONFIG.bak"

# Append the server block for the proxy to nginx.conf
cat >>$NGINX_CONFIG <<EOL

events {
  worker_connections  1024;
}

http {
  server {
      listen 80;
      server_name project.com *.project.com;

      location / {
          proxy_pass http://localhost:3000;
          proxy_set_header Host \$host;
          proxy_set_header X-Real-IP \$remote_addr;
          proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      }
  }

  server {
      listen 80;
      server_name api.project.com;

      location / {
          proxy_pass http://localhost:5000;
          proxy_set_header Host \$host;
          proxy_set_header X-Real-IP \$remote_addr;
          proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      }
  }
}


EOL

# Update /etc/hosts file
echo "Updating /etc/hosts file..."
sudo -- sh -c "echo '127.0.0.1  project.local' >> /etc/hosts"

# Start (or reload) Nginx
echo "Starting Nginx..."
sudo nginx

echo "All tasks completed!"
