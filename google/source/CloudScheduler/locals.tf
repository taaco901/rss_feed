locals {
  CloudScheduler_settings = {
    name        = "rss-fetch-scheduler"
    description = "rss-fetch-scheduler"
    schedule    = "0 9,18 * * *"
    uri         = data.terraform_remote_state.cf_settings.outputs.checkRSSFeeds_url
  }
}
