module "DEV_ENV" {
  source = "./mymodule"

  my_env        = "dev"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  instance_count = 2              # Optional, specify if you want multiple instances
  
}

module "PROD_ENV" {
  source = "./mymodule"

  my_env        = "prod"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  instance_count = 3              # Optional, specify if you want multiple instances
}

module "TEST_ENV" {
  source = "./mymodule"

  my_env        = "test"
  ami           = "ami-0734d584b153e1fc9" # Replace with your actual AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  instance_count =2  # Optional, specify if you want multiple instances
}