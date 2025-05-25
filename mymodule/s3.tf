resource "aws_s3_bucket" "my_app_bucket" {
    bucket = "${var.my_env}-jay-demo-app-bucket"
    count = var.s3_count
    tags = {
        Name = "${var.my_env}-jay-demo-app-bucket-${count.index + 1}"
    }
}