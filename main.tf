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
      App = "day_02"
      # Owner            = var.owner
      Owner = "sean.fitzgerald@home.com"
      # Environment      = var.environment
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
