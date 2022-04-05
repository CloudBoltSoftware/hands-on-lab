terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.42"
    }
  }

  required_version = ">= 0.13.5"
}

# Configure the AWS Provider
provider "aws" {
  profile = "sales"
  region = "us-east-1"
}

resource "aws_s3_bucket" "b1" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = templatefile("resources/policy.json", { bucket = var.bucket_name })

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Owner       = var.owner
    Group       = var.group
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.b1.id
  key          = "index.html"
  source       = "resources/index.html"
  content_type = "text/html"
  etag = filemd5("resources/index.html")
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.b1.id
  key          = "error.html"
  source       = "resources/error.html"
  content_type = "text/html"
  etag = filemd5("resources/error.html")
}

resource "aws_s3_bucket_object" "cb_logo" {
  bucket       = aws_s3_bucket.b1.id
  key          = "cb_logo.png"
  source       = "resources/cb_logo.png"
  etag = filemd5("resources/cb_logo.png")
}
