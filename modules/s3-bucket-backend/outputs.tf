output "bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
  description = "name of the created bucket"
}
