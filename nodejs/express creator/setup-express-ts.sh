#!/bin/bash

# Create a new directory and navigate into it
mkdir my-express-ts-app
cd my-express-ts-app

# Initialize a new Node.js project
yarn init -y

# Install Express and its TypeScript type definitions
yarn add express
yarn add --dev @types/express

# Install TypeScript and set it up
yarn add --dev typescript
npx tsc --init

# Install ts-node for running TypeScript code
yarn add --dev ts-node

# Install nodemon for automatic reloading during development
yarn add --dev nodemon

# Create a src folder and an index.ts file inside it
mkdir src
echo "import express from 'express';

const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, world!');
});

app.listen(port, () => {
  console.log(\`Server running at http://localhost:\${port}/\`);
});
" > src/index.ts

# Update package.json scripts
jq '.scripts += {
  "start": "ts-node src/index.ts",
  "dev": "nodemon --watch \'src/**/*.ts\' --exec \'ts-node\' src/index.ts",
  "build": "tsc"
}' package.json > package.tmp.json && mv package.tmp.json package.json

# Run the project
yarn run dev
