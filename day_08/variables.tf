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

variable "bucket_names" {
  description = "Create several S3 buckets"
  type = list(string)
  default = ["my-first-bucket-001", "my-second-bucket-002", "my-third-bucket-003"]
}

variable "bucket_name_set" {
  description = "S3 bucket creation set"
  type = set(string)
  default = [ "my-first-bucket-004", "my-second-bucket-005", "my-third-bucket-006" ]
}