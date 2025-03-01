module "rss_pubsub" {
  source = "../../module/PubSub"

  topic_name        = local.PubSub_settings.rss_topic.topic_name
  subscription_name = local.PubSub_settings.rss_topic.subscription_name
  push_endpoint_url = local.PubSub_settings.rss_topic.push_endpoint_url
}
