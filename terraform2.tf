provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket2" "bucket" {
  bucket        = "magnussopraworkingbucket"
  force_destroy = true
}
