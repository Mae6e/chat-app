# Use the Alpine version of Node.js
FROM node:20.9.0-alpine

# Install pnpm globally as root
RUN npm install -g pnpm

# Create a project-specific non-root user and group
RUN addgroup -S appGroup && adduser -S appUser -G appGroup

# Set up a custom directory (e.g., /usr/src/app) for the project and give permissions to the non-root user
RUN mkdir -p /usr/src/app && chown -R appUser:appGroup /usr/src/app

# Set the working directory to the new location
WORKDIR /usr/src/app

# Switch to the non-root user
USER appUser

# Copy package files (with proper ownership)
COPY --chown=appUser:appGroup package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code (with proper ownership)
COPY --chown=appUser:appGroup . .

