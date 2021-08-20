# Backend configuration require a AWS storage bucket.
terraform {
  backend "s3" {
    bucket = "s3://terraform-state-igti-psalomao/"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}
