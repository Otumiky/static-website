provider "aws" {
  region = "us-east-1"
}

module "s3_website" {
  source            = "C://Users//madus//Desktop//30 Days of Terraform//30-Day-Terraform-challenge-//Day25//project-root//modules//s3-static-website"
  bucket_name       = "website-cq"
  index_document    = "index.html"
  error_document    = "error.html"
  source_directory  = "C://Users//madus//Desktop//30 Days of Terraform//30-Day-Terraform-challenge-//Day25//project-root//website"
  tags              = {
    Environment = "Development"
    Project     = "Static Website"
  }
}