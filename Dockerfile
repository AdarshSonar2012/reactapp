# Use official Node image
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY package*.json ./
RUN npm install

# Copy the rest of the source code
COPY . .

# Build Vite app
RUN npm run build

# second stage
FROM node:18-alpine

WORKDIR /app

# Install static file server
RUN npm install -g serve
COPY --from=builder /app/dist ./dist
# Serve the built app (dist folder) on port 80
CMD ["serve", "-s", "dist", "-l", "80"]
