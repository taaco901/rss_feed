locals {
  PubSub_settings = {
    rss_topic = {
      topic_name        = "rss_topic"
      subscription_name = "rss_subscription"
      push_endpoint_url = data.terraform_remote_state.cf_url.outputs.sendRSSEmail_url
    }
  }
}
