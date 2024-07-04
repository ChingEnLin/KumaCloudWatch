#!/bin/bash

# Set the path to the Terraform workspace
cd terraform

# Initialize the Terraform workspace
terraform init

# Plan the Terraform deployment
terraform plan -var-file=".tfvar" -out=tfplan

# Apply the Terraform plan
terraform apply tfplan

# Clean up the plan file
rm tfplan

cd ..