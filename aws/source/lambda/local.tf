locals {
  lambda_settings = {
    push_sns_topic = {
      function_name = "rss-push-sns-topic-lambda"
      role_arn      = data.terraform_remote_state.lambda_iam_role_arn.outputs.rss_feed_lambda_iam_arn
      layers        = []
    }
    check_rss_feed = {
      function_name = "rss-check-rss-feed-lambda"
      role_arn      = data.terraform_remote_state.lambda_iam_role_arn.outputs.rss_feed_lambda_iam_arn
      layers        = [data.terraform_remote_state.lambda_feedparser_layer.outputs.feedparser_layer_arn]
    }
  }
}
