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
  - `vpc.tf` - VPC, subnet, and networking configuration
  - `env-key` and `env-key.pub` - SSH key pair for EC2 instances

## Features

- Environment-specific resource naming and tagging
- Configurable instance types and counts per environment
- Public and private subnet configurations
- Shared security group configurations
- Consistent infrastructure across environments
- VPC networking with public and private subnets

## Usage

Each environment can be configured separately in the main.tf file:

```hcl
module "DEV_ENV" {
  source = "./mymodule"

  my_env                = "dev"
  ami                   = "ami-0734d584b153e1fc9"
  instance_type         = "t2.micro"
  public_instance_count = 1
  private_instance_count = 0
  s3_count              = 1
  rds_instance_count    = 1
  create_public_subnet  = true
  create_private_subnet = false
}
```

## Environment Configuration

- **Development**: 1 public t2.micro instance, 1 S3 bucket, 1 RDS instance
- **Production**: 1 public t2.micro instance, 2 private instances, 2 S3 buckets, 2 RDS instances
- **Test**: 1 public t2.micro instance, 1 private instance, 1 S3 bucket, 1 RDS instance

## Networking

The infrastructure includes:
- Public subnet with internet access
- Private subnet (optional per environment)
- Route tables for proper network traffic flow

## Security

The infrastructure includes security groups that allow:
- SSH access (port 22)
- HTTP access (port 80)
- HTTPS access (port 443)

## Database

- RDS MySQL 8.0 instances with configurable count per environment

## Storage

- S3 buckets with environment-specific naming and configurable count

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for EC2 instance access
