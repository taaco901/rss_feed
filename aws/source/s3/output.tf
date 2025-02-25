output "rss_feed_bucket_arn" {
  value = module.rss_feed_bucket.s3_bucket_arn
}

output "rss_feed_bucket_name" {
  value = module.rss_feed_bucket.s3_bucket_name
}
