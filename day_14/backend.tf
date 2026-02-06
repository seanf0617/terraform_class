terraform {
  
backend "s3" {
    bucket = "appvance-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    }

    
}
