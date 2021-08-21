variable "region_id" {
  default = "us-east-2"
}

variable "prefix" {
  default = "datalake-desafio-igti"
}

variable "account" {
  default = 155914520574
}

# Prefix configuration and project common tags
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Project      = "Datalake"
    ManagedBy    = "Terraform"
    Department   = "systems",
    Provider     = "A3DATA",
    Owner        = "Data Engineering"
    BusinessUnit = "Data"
    Billing      = "Infrastructure"
    Environment  = terraform.workspace
    UserEmail    = "rony@a3data.com.br"
  }
}

variable "bucket_names" {
  description = "Create S3 buckets with these names"
  type        = list(string)
  default = [
    "landing-zone",
    "processing-zone",
    "delivery-zone"
  ]
}

variable "database_names" {
  description = "Create databases with these names"
  type        = list(string)
  default = [
    #landing-zone
    "dl_landing_zone",
    "dl_rocessing_zone",
    "dl_delivery_zone"
  ]
}

variable "bucket_paths" {
  description = "Paths to S3 bucket used by the crawler"
  type        = list(string)
  default = [
    "s3://landing-zone-155914520574",
    "s3://processing-zone-155914520574/censo-emr/",
    "s3://delivery-zone-155914520574"
  ]
}

variable "bucket_functions" {
  description = "Create S3 bucket for lambda functions"
  default     = "temp-functions-rony"
}

