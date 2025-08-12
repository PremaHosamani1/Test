terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket2025"
    key            = "StateFile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
#    lock_table     = "terraform-locks"   # Replaces 'dynamodb_table'
    use_lockfile   = true                # Enables state locking
  }
}
