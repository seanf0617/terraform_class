# Create a S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "my-bucket-0617abc"

  tags = {
    Name        = "{$var.Environment}-bucket"
    Environment = var.Environment
  }
}

resource "aws_vpc" "sample" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Environment = var.Environment
    Name        = "{$var.Environment}-VPC"
  }
}

resource "aws_instance" "example" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"

  tags = {
    Environment = var.Environment
    Name        = "{$var.Environment}-EC2-Instance"
  }
}
