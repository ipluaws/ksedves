resource "aws_cloudfront_origin_access_identity" "spa" {
  comment = "OAI for SPA Bucket"
}

resource "aws_cloudfront_distribution" "spa_distribution" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = var.s3_bucket_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.spa.cloudfront_access_identity_path
    }
  }
  origin {
    domain_name = var.alb_dns_name
    origin_id   = "backend-alb-origin"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "SPA CloudFront Distribution"
  default_root_object = "index.html"
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_bucket_id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "backend-alb-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }
    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  tags = {
    Name = "SPA Distribution"
  }
}

