module "aws_sns_topic" {
  source = "../../module/SNS"

  #循環回避のためハードコーディング
  topic_name = "rss-feed-topic"
  # topic_name    = local.sns_settings.topic_name
  email_address = "hashimoto111333+rss@gmail.com"
  rss_policy    = local.sns_settings.rss_policy
}
