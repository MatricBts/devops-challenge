resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"  
  }
}

resource "aws_s3_bucket_object" "object" {
  acl    = "public-read"
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
                "Action": ["s3:GetObject", "s3:PutObject"],
                "Resource": "arn:aws:s3:::devops-challenger-calculator-matric/*"
            }
        ]
    }
POLICY
}


