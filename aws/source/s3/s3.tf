
module "rss_feed_bucket" {
  source = "../../module/S3"

  bucket_name = local.s3_settings.rss_feed_bucket.bucket_name
}
