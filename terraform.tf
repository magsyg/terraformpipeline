provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket        = "workingbucket"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "test" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "upload_object" {
  for_each     = fileset("src/", "*")
  bucket       = aws_s3_bucket.bucket.id
  key          = each.value
  source       = "src/${each.value}"
  etag         = filemd5("src/${each.value}")
  content_type = "text/html"
}
