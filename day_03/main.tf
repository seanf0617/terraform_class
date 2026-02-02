terraform {
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
      App = "day_03"
      # Owner            = var.owner
      Owner = "sean.fitzgerald@home.com"
      # Environment      = var.environment
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}

# Create a S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "my-bicket-0617abc"

  tags = {
    Name        = "My bucket"
    Environment = "dev"

  }
}
