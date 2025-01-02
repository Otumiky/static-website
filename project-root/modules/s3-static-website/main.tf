resource "aws_s3_bucket" "wb" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "wb" {
  bucket = aws_s3_bucket.wb.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_object" "files" {
  for_each = fileset(var.source_directory, "**")
  bucket   = aws_s3_bucket.wb.id
  key      = each.value
  source   = "${var.source_directory}/${each.value}"

  content_type = lookup(
    {
      html = "text/html",
      css  = "text/css",
      js   = "application/javascript"
    },
    split(".", each.value)[length(split(".", each.value)) - 1], # Fix for negative indexing
    "application/octet-stream"
  )
}
resource "aws_s3_bucket_public_access_block" "wb" {
  bucket                  = aws_s3_bucket.wb.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "wb" {
  bucket = aws_s3_bucket.wb.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.wb.arn}/*"
      }
    ]
  })
}