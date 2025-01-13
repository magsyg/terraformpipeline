provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "bucket2" {
  bucket        = "magnussopraworkingbucket"
  force_destroy = true
}