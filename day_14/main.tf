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
  description = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_s3_bucket_policy" "allow_cf" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_cf" {
  statement {
    principals {
      type = "AWS"

    }
  }
}
