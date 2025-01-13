resource "aws_s3_bucket2" "bucket" {
  bucket        = "magnussopraworkingbucket"
  force_destroy = true
}
