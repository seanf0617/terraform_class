resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.website-bucket.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_control" "originacesscontrol" {
  name = "originaccesscontrol"
  origin_type = "s3"
  http_policy = "HTTPS_ONLY"
  supported_distributions = [aws_cloudfront_distribution.distribution.id]
}