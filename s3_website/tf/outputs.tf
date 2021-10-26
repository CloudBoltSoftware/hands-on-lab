output "website_endpoint" {
  value = aws_s3_bucket.b1.website_endpoint
}

output "bucket_name" {
  value = aws_s3_bucket.b1.id
}
