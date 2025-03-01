locals {
  CloudFunction_settings = {
    checkRSSFeeds = {
      source_bucket_name = "checkrssfeeds_source_bucket"
      source_object_name = "main.zip"
      source_obj         = "D:\\AWS\\RSS\\rss_feed\\python\\gcp_checkRSSFeeds\\main.zip"
      project_id         = "rss-feed-452016"
      cf_name            = "checkRSSFeeds"
    },
    sendRSSEmail = {
      source_bucket_name = "sendrssemail_source_bucket"
      source_object_name = "main.zip"
      source_obj         = "D:\\AWS\\RSS\\rss_feed\\python\\gcp_checkRSSFeeds\\main.zip"
      project_id         = "rss-feed-452016"
      cf_name            = "sendRSSEmail"
    }
  }
}
