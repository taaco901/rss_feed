module "rss_feed_kick_eventbridge" {
  source = "../../module/eventbrigde"

  lambda_arn  = local.target_lambda_arn
  lambda_name = local.target_lambda_name
}

