resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "uv-jenkins-lab-bkt-"
  force_destroy = true
  

  tags = {
    Name = "uv-jenkins-lab-bkt"
  }
}

resource "aws_s3_bucket" "jenkins_lab" {
  bucket = "uv-jenkins-lab-bkt"
}

resource "aws_s3_bucket_public_access_block" "jenkins_lab" {
  bucket = aws_s3_bucket.jenkins_lab.id

  # Allow public policies/ACLs so the bucket and objects can be made public
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/confirmation_image.png"
  source = "Screenshots/confirmation_image.png"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("Screenshots/confirmation_image.png")
  acl  = "public-read"
}

resource "aws_s3_bucket_object" "console_output" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/console_output.png"
  source = "Screenshots/console_output.png"
  etag   = filemd5("Screenshots/console_output.png")
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "current_webhook_data" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/current_webhook_data.png"
  source = "Screenshots/current_webhook_data.png"
  etag   = filemd5("Screenshots/current_webhook_data.png")
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "pipeline_data" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/pipeline_data.png"
  source = "Screenshots/pipeline_data.png"
  etag   = filemd5("Screenshots/pipeline_data.png")
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "pipeline_success" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/pipeline_success.png"
  source = "Screenshots/pipeline_success.png"
  etag   = filemd5("Screenshots/pipeline_success.png")
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "polling_log" {
  bucket = aws_s3_bucket.jenkins_lab.bucket
  key    = "Screenshots/polling_log.png"
  source = "Screenshots/polling_log.png"
  etag   = filemd5("Screenshots/polling_log.png")
  acl    = "public-read"
}
