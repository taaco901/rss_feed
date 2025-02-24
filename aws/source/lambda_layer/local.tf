locals {
  lambda_layer = {
    feedparser = {
      name                = "feedparser_layer"
      description         = "Feedparser layer"
      compatible_runtimes = ["python3.12"]
      zip_path            = "D:\\AWS\\RSS\\rss_feed\\python\\feedparser_lambda_layer\\python.zip"
    }
  }
}
