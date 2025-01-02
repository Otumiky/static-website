terraform {
  backend "s3" {
    bucket         = "website-state"
    key            = "website/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
    encrypt        = true
  }
}