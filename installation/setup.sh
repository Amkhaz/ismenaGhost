#!/bin/bash

# Update and upgrade the system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Nginx
sudo apt-get install nginx -y

# Add additional system updates and package preparations
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings

# Add the GPG key for the NodeSource repository
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Set the Node.js major version to install
NODE_MAJOR=18 # Make sure this version is still supported

# Add the NodeSource repository to your system's software repository list
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Update system package lists and install Node.js
sudo apt-get update
sudo apt-get install nodejs -y

# Install Ghost-CLI globally
sudo npm install ghost-cli@latest -g

# Create a directory for your site
SITE_NAME=sitename
sudo mkdir -p /var/www/$SITE_NAME

# Replace 'username' with your GCP VM's username or use $USER to refer to the current user
sudo chown $USER:$USER /var/www/$SITE_NAME

# Set the correct permissions
sudo chmod 775 /var/www/$SITE_NAME

# Navigate to the site directory
cd /var/www/$SITE_NAME
