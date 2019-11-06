// The following are the tasks implemented as a part of this terraform script
//
// 1. Create a bucket with a specific name with acl set to private
// 2. Enable versioning
// 3. Enable default Serverside encryption
// 4. Enable Lifecycle rules
      // Versioning:
      //   Current Version: Standard -> Intelligent tiering (after 90 days)
      //   Earlier Version: Standard -> Glacier (Afer 90 days)
      //                    Standard -> Deep Archive (After 365 days)
      //
      // Expiration:
      //   Current Version: Not applicable
      //   Earlier Version: Will be permanently deleted after 400 days.

resource "aws_s3_bucket" "new_bucket" {
  bucket = var.bucket_name
  acl = "private"
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true
    abort_incomplete_multipart_upload_days = 5

    transition {
      days = 90
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_transition {
      days = 90
      storage_class = "GLACIER"
    }

    noncurrent_version_transition {
      days = 365
      storage_class = "DEEP_ARCHIVE"
    }

    noncurrent_version_expiration {
      days = 400
    }
  }

  tags = {
    name = var.bucket_name
  }
}
