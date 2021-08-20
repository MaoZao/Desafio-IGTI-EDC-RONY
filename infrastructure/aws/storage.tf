resource "aws_s3_bucket" "buckets" {
  count  = length(var.bucket_names)
  bucket = "${local.prefix}-${var.bucket_names[count.index]}-${var.account}"
  acl    = "private"

  tags = local.common_tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}



resource "aws_s3_bucket" "bucket_functions" {
  bucket = "${local.prefix}-${var.bucket_functions}-${var.account}"
  acl    = "private"

  tags = local.common_tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "null_resource" "fn_example_script" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "zip -rj ../../functions/fn_example_script.zip ../../functions/fn_example_script"
  }
}


resource "aws_s3_bucket" "bucket_functions_emr" {
  bucket = "${local.prefix}-${var.bucket_functions}-${var.account}"
  key    = "emr-code/pyspark/job_spark.py"
  acl    = "private"
  source = "../etl/job_spark.py"
  etag   = filemd5("../etl/job_spark.py")
}