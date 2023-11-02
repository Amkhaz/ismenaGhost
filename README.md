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

## Design/Architecture

### Production Environment

The production environment has been architected to leverage Google Cloud Platform's (GCP) robust, scalable infrastructure, ensuring high availability, fault tolerance, and performance:

- **Content Delivery Network (CDN):** Utilizing GCP's Cloud CDN for efficient content distribution and reduced latency by caching content at the edge of Google's network.
  
- **Load Balancing and Auto-scaling:** Multi-zone Virtual Machine (VM) instances with auto-scaling groups to manage load effectively and ensure seamless scaling during traffic surges.

- **Database:** A SQL database with read replica configuration to distribute database queries efficiently and improve the application's read performance.

- **Cloud Storage:** All static assets such as images and videos are stored in Google Cloud Storage, providing a durable and highly available object storage solution.

- **Disaster Recovery:** Regular snapshots and backups are implemented to ensure data durability and to provide recovery options in case of data loss.

### Development Environment

The development environment prioritizes agility and developer experience:

- **Test VM:** Developers are provided with VM instances to create, push, and test their code in an isolated environment, closely mimicking the production settings.

- **CI/CD Pipeline:** A continuous integration and delivery pipeline is set up for automated testing and deployment, streamlining the development workflow.

- **Image Templates:** We use custom VM image templates that include all the necessary configurations and dependencies. These images are regularly updated to reflect the latest code changes from the development environment.

### Simplified Free Tier (test case)


- **Single VM Setup:** A simple yet effective setup with a VM instance that includes a static IP. This setup runs the Ghost content management system and Nginx web server.

- **SQL Instance:** A managed MySQL database instance is configured to provide data persistence and management capabilities.

- **Domain and SSL:** We've set up a domain name with an SSL/TLS certificate, ensuring secure connections to the VM's static IP.


