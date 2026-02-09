variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "Environment" {
  default = "dev"
  type = string
}

variable "instance_count" {
  description = "Number of EC2 instrances"
  type = number  
} 

variable "tags" {
  type = map(string)

  default = {
    Environment = "dev"
    Name = "dev-instance"
    created_by = "terraform"
  }
}

variable "ingress_rules" {
  description = "List of Ingress rules for security group"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port = 80,
      to_port = 80,
      protocol = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
      description = "HTTP"
    },
    {
      from_port = 443,
      to_port = 443,
      protocol = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
      description = "HTTPS"
    }
  ]
}

variable "bucket" {
  default = "my-website-from-tf-1234"
}