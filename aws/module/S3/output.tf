output "s3_bucket_arn" {
  value = aws_s3_bucket.rss_feed_bucket.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.rss_feed_bucket.bucket
}
