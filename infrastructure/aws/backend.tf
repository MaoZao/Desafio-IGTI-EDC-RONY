# Backend configuration require a AWS storage bucket.
terraform {
  backend "s3" {
    bucket = "datalake-desafio-igti-tf"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}
