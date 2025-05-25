variable "my_env" {
    description = "The environment for the app"
    type = string
}

variable "instance_type" {
    description = "value of the instance type"
    type = string
}

variable "ami" {
    description = "value of the ami"
    type = string
}

variable "public_instance_count" {
    description = "Number of instances to create"
    type        = number
    default     = 1 
  
}


variable "region" {
  default = "us-east-1"
}

variable "create_public_subnet" {
  type    = bool
  default = true
}

variable "create_private_subnet" {
  type    = bool
  default = true
}

variable "public_subnet_cidr" {
  default = "172.31.100.0/24"
}

variable "private_subnet_cidr" {
  default = "172.31.101.0/24"
}

variable "public_az" {
  default = "us-east-1a"
}

variable "private_az" {
  default = "us-east-1b"
}

  
variable "associate_public_ip_address" {
  description = "EC2 instance in private subnet"
    type        = bool
    default     = true
}
variable "private_instance_count"{
    description = "no. EC2 instance in private subnet"
    type        = number
    default     = 0

}
variable "s3_count" {
    description = "Number of S3 buckets to create"
    type        = number
    default     = 1
  
}
variable "rds_instance_count" {
    description = "Number of RDS instances to create"
    type        = number
    default     = 1
}