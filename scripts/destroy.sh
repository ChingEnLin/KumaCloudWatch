#!/bin/bash

# Set the path to the Terraform workspace
cd terraform

# Plan the Terraform destroy
terraform plan -var-file=".tfvar" -destroy -out=tfdestroyplan

# Apply the Terraform plan
terraform apply tfdestroyplan

# Clean up the plan file
rm tfdestroyplan

cd ..