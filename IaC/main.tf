resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    error_document = "index.html"

    routing_rules = <<EOF
      [{
          "Condition": {
              "KeyPrefixEquals": "docs/"
          },
          "Redirect": {
              "ReplaceKeyPrefixWith": "documents/"
          }
      }]
      EOF
  }
}

resource "aws_s3_bucket_object" "object" {
  for_each = fileset("../calculator/build/", "**")
  bucket = aws_s3_bucket.b.id
  key    = each.value
  source = "../calculator/build/${each.value}"
  etag = filemd5("../calculator/build/${each.value}")

}

resource "aws_s3_bucket_policy" "b" {
  bucket = aws_s3_bucket.b.id

  policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicReadGetObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::devops-challenger-calculator-matric/*"
            }
        ]
    }
POLICY
}


