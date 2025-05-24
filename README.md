# Multi-Environment Terraform Infrastructure

This project demonstrates how to use Terraform modules to create and manage multiple environments (Development, Production, and Test) with consistent infrastructure but environment-specific configurations.

## Project Structure

- `main.tf` - Main configuration file that defines the three environments (dev, prod, test)
- `mymodule/` - Reusable module that contains the infrastructure components
  - `ec2.tf` - EC2 instance configuration with security groups
  - `s3.tf` - S3 bucket configuration
  - `rds.tf` - RDS database configuration
  - `var.tf` - Variable definitions for the module
  - `provider.tf` - AWS provider configuration
  - `env-key` and `env-key.pub` - SSH key pair for EC2 instances

## Features

- Environment-specific resource naming and tagging
- Configurable instance types and counts per environment
- Shared security group configurations
- Consistent infrastructure across environments

## Usage

Each environment can be configured separately in the main.tf file:

```hcl
module "DEV_ENV" {
  source = "./mymodule"

  my_env        = "dev"
  ami           = "ami-0734d584b153e1fc9"
  instance_type = "t2.micro"
  instance_count = 2
}
```

## Environment Configuration

- **Development**: 2 t2.micro instances
- **Production**: 3 t2.micro instances
- **Test**: 2 t2.micro instances

## Security

The infrastructure includes security groups that allow:
- SSH access (port 22)
- HTTP access (port 80)
- HTTPS access (port 443)

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for EC2 instance access
