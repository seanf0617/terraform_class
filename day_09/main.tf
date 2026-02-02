resource "aws_instance" "example" {
    ami  = "ami-0ff8a91507f77f867"
    instance_type = "t2.micro"
    region = var.region
    tags = var.tags

    lifecycle {
      create_before_destroy = true
    }
}


resource aws_s3_bucket "bucket1" {
    count = 3
    bucket = var.bucket_names[count.index]
    
    tags = var.tags
}

resource "aws_s3_bucket" "bucket2" {
    for_each = var.bucket_name_set
    bucket = each.key
    
    tags = var.tags

    depends_on = [ aws_s3_bucket.bucket1 ]
}

