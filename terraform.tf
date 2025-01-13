resource "aws_s3_bucket" "bucket" {
  bucket        = "magnusnewsoprabucket"
  force_destroy = true
}

resource "aws_s3_object" "upload_object" {
  for_each     = fileset("src/", "*")
  bucket       = aws_s3_bucket.bucket.id
  key          = each.value
  source       = "src/${each.value}"
  etag         = filemd5("src/${each.value}")
  content_type = "text/html"
}
