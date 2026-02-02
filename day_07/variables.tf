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