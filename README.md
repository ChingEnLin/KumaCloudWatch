# KumaCloudWatch

Welcome to **KumaCloudWatch**! This repository contains the code to set up and run [Uptime-Kuma](https://github.com/louislam/uptime-kuma) on Azure App Service using Terraform for deployment. Uptime-Kuma is a self-hosted monitoring tool that helps you track the uptime of your services.

## Table of Contents

- [KumaCloudWatch](#kumacloudwatch)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Destroying the Infrastructure](#destroying-the-infrastructure)
  - [Configuration](#configuration)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

**KumaCloudWatch** leverages Azure App Service to host Uptime-Kuma, allowing you to monitor the availability and performance of your applications and services. The setup is defined using HashiCorp Configuration Language (HCL) for easy infrastructure management and deployment.

## Features

- **Easy Setup**: Deploy Uptime-Kuma on Azure App Service with minimal configuration.
- **Scalability**: Utilize Azure's robust infrastructure to ensure your monitoring tool can handle large-scale environments.
- **Persistent Data Storage**: Mounted Azure Storage File Share to the web app to ensure data retention even when the Docker container is rebooted.
- **Continuous Integration**: CI enabled to keep the application up to date with the latest features and improvements.
- **Customizable**: Define your monitoring parameters and thresholds using HCL.
- **Self-Hosted**: Maintain control over your monitoring data by hosting Uptime-Kuma yourself.
- **One-Command Deployment and Destruction**: Shell scripts provided to deploy and destroy the infrastructure in a single command.

## Prerequisites

Before you begin, ensure you have the following:

- An [Azure account](https://azure.microsoft.com/en-us/free/).
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.

## Installation

Follow these steps to deploy Uptime-Kuma on Azure App Service:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/KumaCloudWatch.git
    cd KumaCloudWatch
    ```

2. **Configure Azure CLI**:
    ```bash
    az login
    ```

3. **Deploy the Infrastructure**:
    ```bash
    ./deploy.sh
    ```

Once the deployment is complete, the script will output the URL of your Uptime-Kuma instance.

## Usage

Access your Uptime-Kuma instance via the provided URL. You can start adding services to monitor and configure your uptime checks as needed.

## Destroying the Infrastructure

If you need to tear down the infrastructure, simply run:
```bash
./destroy.sh
```

## Configuration

The `main.tf` file contains the primary configuration for deploying Uptime-Kuma on Azure App Service. You can customize the settings such as resource group name, app service plan, and other parameters according to your requirements.

## Contributing

We welcome contributions to improve KumaCloudWatch! If you have suggestions, bug reports, or feature requests, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
