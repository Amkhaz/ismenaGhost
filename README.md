# Ghost GCP Deployment

## Overview
This repository contains the necessary configurations and procedures to deploy a Ghost blog platform using Nginx as a reverse proxy, along with SSL configuration, on GCP.

## Features
- Automated scripts for installing and configuring Ghost.
- Nginx configuration files for setting up a reverse proxy.
- SSL configuration instructions.
- Maintenance and operational scripts.

## Prerequisites
- A virtual machine on  Google Cloud Platform.
- A domain name with an SSL certificate.
- A Google Cloud SQL instance or equivalent for Ghost database management.

## Configuration Details

### Ghost
- **Version**: `5.71.1`
- **Node Version**: `v18.18.2`
- **Environment**: Production
- **Site URL**: `https://isolutionsghost.fr`

### Nginx
- Configured as a reverse proxy to serve the Ghost blog.
- HTTPS support using SSL certificates.
- HTTP to HTTPS redirection.

### SSL Certificate
- The SSL certificate and private key are placed in the Nginx configuration to secure the blog.

## Instructions


### Nginx Configuration
The Nginx configuration file `isolutionsghost.fr.conf` should be placed in `/etc/nginx/sites-available/` with a symbolic link in `/etc/nginx/sites-enabled/`.

### SSL Certificate Setup
The SSL certificate `.cer` file and private key `.key` should be located in the Nginx directory and referenced in the Nginx configuration.

### Domain Configuration
Ensure your domain's DNS settings point the A record to the cloud VM's external IP address.

### Persistent Storage
If your cloud VM does not retain data after reboot, set up persistent storage according to your cloud provider's documentation.

## Troubleshooting
- Run `ghost doctor` for diagnosing and fixing common Ghost issues.
- Check Nginx logs at `/var/log/nginx/error.log` for server issues.
- Inspect Ghost logs using `journalctl -u ghost_<instance-name>` for Ghost-related issues.

## Repository Contents
```
/
├── configurations/
│   ├── nginx/
│   │   └── isolutionsghost.fr.conf
└── README.md
```

## Contributing
Contributions to this project are welcome! Please fork the repository and submit a pull request with your changes.

## License
This project is open-sourced under the MIT License.

## Acknowledgments
- Ghost, for the professional publishing platform.
- Let's Encrypt, for SSL certificate provisioning.
- Cloud service providers for their VM offerings.

## Contact Information
For help or questions regarding this setup, please open an issue in this repository or contact the repository maintainers.
```
