# Use Ubuntu 22 as the base image
FROM ubuntu:22.04

# Update the package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    mongodb \
    nodejs \
    npm \
    python3 \
    python3-pip \
    python3-dev \
    build-essential

# Install Django
RUN pip3 install Django

# Expose ports for MongoDB and your application (adjust as needed)
EXPOSE 27017 8000

# Create a working directory for your application
WORKDIR /app

# Copy your application files into the container
COPY . /app

# Install Node.js and Express.js dependencies
RUN npm install express

# Replace "node server.js" with the command to start your Node.js/Express.js application
CMD ["node", "server.js"]
