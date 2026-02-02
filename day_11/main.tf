resource "aws_s3_bucket" "firsts3" {
  bucket = local.formatted_bucket_name
#  tags = merge(var.default_tags,var.environment_tags)
  tags = local.new_tag
}

