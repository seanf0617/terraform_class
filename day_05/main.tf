terraform {
  backend "s3" {
    bucket  = "appvance-bucket"
    key     = "dev/terrafor.tfstate"
    region  = "us-east-1"
    encrypt = true
    #use_lockfile = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>6.0"
    }
  }
  required_version = "= 1.6.6"
}

provider "aws" {
  # Configuration options
  region = var.region

  default_tags {
    tags = {
      # App              = var.app_name
      App = "day_05"
      # Owner            = var.owner
      Owner = "sean.fitzgerald@home.com"
      # Environment      = var.environment
      Environment = var.Environment
      ManagedBy   = "terraform"
    }
  }
}

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

output "vpc_id" {
  value = aws_vpc.sample.id
}


output "ec2_id" {
  value = aws_instance.example.id
}

