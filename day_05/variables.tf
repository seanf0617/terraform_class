variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "Environment" {
  default = "dev"
  type = string
}

# variable "app_name"      { type = string  default = "day_02_app" }
# variable "owner"         { type = string  default = "sean.fitzgerald@home.com" }
# variable "environment"   { type = string  default = "dev" }
