locals  {
    # show ids for all instances
    #all_instance_ids = aws_instance.example[*].id
    origin_id = "S3-${aws_s3_bucket.website-bucket.id}"
}

