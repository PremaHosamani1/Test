provider "aws" {
  region = var.region
}


# DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = var.name
  billing_mode = var.billing_mode
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
