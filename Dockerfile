# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Build the Vite app
RUN npm run build

# Install lightweight static server
RUN npm install -g serve

# Serve the build folder (Vite outputs to `dist`)
CMD ["serve", "-s", "dist", "-l", "3000"]
