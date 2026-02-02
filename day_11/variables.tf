variable "project_name" {
  default = "Project ALPHA Resource"
}

variable "default_tags" {
  default = {
    company = "ACMECorp"
    managedby = "terraform"
  }
}

variable "environment_tags" {
  default = {
    environment = "dev"
    cost_center = "cc-123"
  }
}

variable "bucket_name" {
  default = "ProjectAlphaStorageBucket with CAPS and Spaces!!!!!"
}

variable "allowed_ports" {
  default = "80,443,8080,3306"
}
