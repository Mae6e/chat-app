# Use the Alpine version of Node.js
FROM node:20.9.0-alpine

# Install pnpm globally as root
RUN npm install -g pnpm

# Set the working directory to the new location
WORKDIR /app

# Copy package files 
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code 
COPY . .

