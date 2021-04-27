variable "region" {
  description = "AWS Region"
  
}

variable "bucket_name" {
  description = "Bucket to store terraform state file"
  type        = string
}

variable  "sse_algorithm" {
  description = "server side encryption algorithm"
  type        = string
}


variable "dynamodb_table_name" {
  description = "Name of dynamodb table for state locking"
  type        = string
}
