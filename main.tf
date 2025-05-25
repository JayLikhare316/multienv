module "DEV_ENV" {
  source = "./mymodule"

  my_env        = "dev"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  public_instance_count = 1
  private_instance_count = 0        # Optional, specify if you want multiple instances
  s3_count = 1
  rds_instance_count = 1
  create_public_subnet = true
  create_private_subnet = false
  
}

module "PROD_ENV" {
  source = "./mymodule"

  my_env        = "prod"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  public_instance_count = 1
  private_instance_count = 2  # Optional, specify if you want multiple instances
  s3_count = 2
  rds_instance_count = 2
  create_public_subnet = true
  create_private_subnet = true
}

module "TEST_ENV" {
  source = "./mymodule"

  my_env        = "test"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  public_instance_count = 1  # Optional, specify if you want multiple instances
  private_instance_count = 1 # Optional, specify if you want multiple instances
  s3_count = 1
  rds_instance_count = 1
  create_public_subnet = true
  create_private_subnet = false
}
