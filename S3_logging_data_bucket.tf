## Random Id's

resource "random_id" "id_1" {
  byte_length = 2
}

resource "random_id" "id_2" {
  byte_length = 2
}

## Buckets creation

resource "aws_s3_bucket" "region01_bucket" {
  provider            = aws.region-1
  bucket              = "cloudtrail-logs-stream-${var.region_1}-${random_id.id_1.dec}"
  object_lock_enabled = true

  versioning {
    enabled = true
  }
  lifecycle {
    ignore_changes = [
      grant,
      lifecycle_rule
    ]
  }
  tags = {
    account_CI = "AWS security admin group"
    app_id     = "AWSSECHS"
  }

}

resource "aws_s3_bucket" "region02_bucket" {
  provider            = aws.region-2
  bucket              = "cloudtrail-logs-stream-${var.region_2}-${random_id.id_2.dec}"
  object_lock_enabled = true

  versioning {
    enabled = true
  }
  lifecycle {
    ignore_changes = [
      grant,
      lifecycle_rule
    ]
  }
  tags = {
    account_CI = "AWS security admin group"
    app_id     = "AWSSECHS"
  }
}

## Bucket policies

resource "aws_s3_bucket_policy" "region01_bucket_policy" {
  provider = aws.region-1
  bucket   = aws_s3_bucket.region01_bucket.bucket
  policy   = data.aws_iam_policy_document.region01_bucket_policy.json
}

resource "aws_s3_bucket_policy" "region02_bucket_policy" {
  provider = aws.region-2
  bucket   = aws_s3_bucket.region02_bucket.bucket
  policy   = data.aws_iam_policy_document.region02_bucket_policy.json
}

## Bucket Lifecycle policies

resource "aws_s3_bucket_lifecycle_configuration" "region01_bucket_lc" {
  provider = aws.region-1
  bucket   = aws_s3_bucket.region01_bucket.bucket
  rule {
    id = "source-replication-lifecycle-rule"
    filter {}
    status = "Enabled"
    transition {
      days          = 100
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 270
      storage_class = "ONEZONE_IA"
    }

    transition {
      days          = 730
      storage_class = "GLACIER"
    }

    expiration {
      days = 1100
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "region02_bucket_lc" {
  provider = aws.region-2
  bucket   = aws_s3_bucket.region02_bucket.bucket
  rule {
    id = "destination-replication-lifecycle-rule"
    filter {}
    status = "Enabled"
    transition {
      days          = 100
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 270
      storage_class = "ONEZONE_IA"
    }

    transition {
      days          = 730
      storage_class = "GLACIER"
    }

    expiration {
      days = 1100
    }
  }
}

## blocking the public access

resource "aws_s3_bucket_public_access_block" "region01_public_access_block" {
  provider = aws.region-1
  bucket   = aws_s3_bucket.region01_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "region02_public_access_block" {
  provider = aws.region-2
  bucket   = aws_s3_bucket.region02_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

## Bucket lock enabled for 60 days in compliance mode

resource "aws_s3_bucket_object_lock_configuration" "region01_bucket_lock" {
  provider = aws.region-1
  bucket   = aws_s3_bucket.region01_bucket.bucket
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 60
    }
  }
}

resource "aws_s3_bucket_object_lock_configuration" "region02_bucket_lock" {
  provider = aws.region-2
  bucket   = aws_s3_bucket.region02_bucket.bucket
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 60
    }
  }
}
