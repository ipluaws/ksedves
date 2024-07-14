resource "aws_s3_bucket" "spa_bucket" {
  bucket = var.bucket_name
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  tags = {
    Name = "SPA Bucket"
  }
}

resource "aws_s3_bucket_policy" "spa_bucket_policy" {
  bucket = aws_s3_bucket.spa_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.spa_bucket.arn}/*"
      }
    ]
  })
}

