#!/bin/sh

# Check if .NET CLI is available
dotnet --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo ".NET CLI is not installed. Please install it first."
  exit 1
fi

# Check if MAUI workload is installed
maui_check=$(dotnet workload list | grep "maui" | wc -l)
if [ $maui_check -eq 0 ]; then
  echo "Installing MAUI workload..."
  dotnet workload install maui
  if [ $? -ne 0 ]; then
    echo "Failed to install MAUI workload."
    exit 1
  fi
else
  echo "MAUI workload is already installed."
fi

# Prompt user for project name
read -p "Enter the name for your MAUI project: " project_name

# Create a new MAUI project
dotnet new maui -n $project_name

if [ $? -ne 0 ]; then
  echo "Failed to create MAUI project."
  exit 1
fi

echo "MAUI project '$project_name' created successfully."
