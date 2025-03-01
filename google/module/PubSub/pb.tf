resource "google_pubsub_topic" "rss_topic" {
  name = var.topic_name
}


resource "google_pubsub_subscription" "rss_subscription" {
  name  = var.subscription_name
  topic = google_pubsub_topic.rss_topic.id

  push_config {
    push_endpoint = var.push_endpoint_url
  }
}
