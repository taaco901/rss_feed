locals {
  target_lambda_arn  = data.terraform_remote_state.lambda.outputs.lambda_arns["rss-check-rss-feed-lambda"]
  target_lambda_name = data.terraform_remote_state.lambda.outputs.lambda_names["rss-check-rss-feed-lambda"]
}
