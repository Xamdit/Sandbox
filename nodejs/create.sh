#!/bin/bash

# Check if a project name is supplied
if [ -z "$1" ]; then
  echo "Please provide a project name."
  exit 1
fi

# Create a new Next.js app
echo "Creating a new Next.js app..."
npx create-next-app $1

# Navigate to the project directory
cd $1

# Set up TypeScript
echo "Setting up TypeScript..."
npm install --save typescript @types/react @types/node

# Create a tsconfig.json file
echo "Creating tsconfig.json..."
npx tsc --init

# Rename _app.js and index.js to their TypeScript equivalents
mv pages/_app.js pages/_app.tsx
mv pages/index.js pages/index.tsx

# Done
echo "Next.js with TypeScript setup is complete."
