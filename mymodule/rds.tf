resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "${var.my_env}-mydb-${count.index + 1}"
  count                = var.rds_instance_count
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}