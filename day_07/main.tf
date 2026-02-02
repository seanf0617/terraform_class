resource "aws_instance" "example" {
  count = var.instance_count
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  region = var.region

  tags = {
    Environment = var.Environment
    Name        = "{$var.Environment}-EC2-Instance"
  }
}
