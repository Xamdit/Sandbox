#!/bin/bash

# Check if Nginx is installed
if ! command -v nginx &>/dev/null; then
  echo "Nginx is not installed. Please wait."
  # sh ./install.sh
fi

# Function to create vhost configuration
create_vhost() {
  read -p "Enter the server name (e.g., mywebsite.local): " server_name
  read -p "Enter the port number to listen on (e.g., 8080): " port_number

  # Validate if port number is a number
  if ! [[ "$port_number" =~ ^[0-9]+$ ]]; then
    echo "Invalid port number. Please enter a valid number."
    exit 1
  fi

  # Set up the vhost configuration
  vhost_conf="./nginx/conf.d/${server_name}.conf"
  echo "Creating vhost configuration for $server_name on port $port_number..."

  cat >"$vhost_conf" <<EOF
server {
    listen $port_number;
    server_name $server_name;
    location / {
        proxy_pass http://localhost:$port_number;
        # Additional configuration if needed
    }
}
EOF

  echo "Vhost configuration created at $vhost_conf"
  echo "Please restart Nginx for changes to take effect."
}

# Execute the create_vhost function
create_vhost
