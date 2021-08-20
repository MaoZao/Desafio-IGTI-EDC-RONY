# Backend configuration require a AWS storage bucket.
terraform {
  backend "s3" {
    bucket = "s3://terraform-state-igti-psalomao/"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}
