data "aws_vpc" "app_vpc" {
    filter {
      name = "tag:Name"
      values = ["default"]  # use base vpc name from AWS
    }
}

data "aws_subnet" "app_subnet1" {
  filter {
    name = "tag:Name"
    values = ["subnet1"]  # use subnet name from AWS
  }
  vpc_id = data.aws_vpc.app_vpc.id
}

data "aws_ami" "linux2" {
  owners = "amazon"
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "example" {
    ami = data.aws_ami.linux2.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.app_subnet1.id
    tags = var.tags
}

