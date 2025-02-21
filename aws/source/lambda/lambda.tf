module "rssfeed_lambda" {
  source = "../../module/lambda"

  role_arn = local.rss_feed.role_arn
  function_name = local.rss_feed.function_name

}