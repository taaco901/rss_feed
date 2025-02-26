locals {
  CloudScheduler_settings = {
    name        = "rss-fetch-scheduler"
    description = "rss-fetch-scheduler"
    schedule    = "0 9,18 * * *"
    uri         = "https://google.com"
  }
}
