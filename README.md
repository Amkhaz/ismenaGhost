# Ghost GCP Deployment

## Overview
This repository contains the necessary configurations and procedures to deploy a Ghost blog platform using Nginx as a reverse proxy, along with SSL configuration, on GCP.

## Features
- Automated scripts for installing and configuring Ghost.
- Nginx configuration files for setting up a reverse proxy.
- SSL configuration instructions.

## Prerequisites
- An account on Google Cloud Platform.
- A domain name with an SSL certificate.

## Configuration Details

### Ghost
- **Version**: `5.71.1`
- **Node Version**: `v18.18.2`
- **Environment**: Development
- **Site URL**: `https://isolutionsghost.fr`

### Nginx
- Configured as a reverse proxy to serve the Ghost blog.
- HTTPS support using SSL certificates.
- HTTP to HTTPS redirection.

### SSL Certificate
- The SSL certificate and private key are placed in the Nginx configuration to secure the blog.

## Instructions
- guide in installation folder

### Nginx Configuration
The Nginx configuration file `isolutionsghost.fr.conf` should be placed in `/etc/nginx/sites-available/` with a symbolic link in `/etc/nginx/sites-enabled/`.

### SSL Certificate Setup
The SSL certificate `.cer` file and private key `.key` should be located in the Nginx directory and referenced in the Nginx configuration.

### Domain Configuration
Ensure your domain's DNS settings point the A record to the GCP VM's external IP address (static IP).

## Troubleshooting
- Run `ghost doctor` for diagnosing and fixing common Ghost issues.
- Check Nginx logs at `/var/log/nginx/error.log` for server issues.

## Repository Contents
```
/
├── configurations/
│   ├── nginx/
│      └── isolutionsghost.fr.conf
├── installation/
│   ├── Ghost-guide.txt/
│
├── GCP-architecture.drawio.pdf
│      
└── README.md
```

