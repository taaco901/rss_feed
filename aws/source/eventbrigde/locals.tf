locals {
  eventbridge_settings = {
    morning_rule = {
      rule_name           = "rss-feed-eventbridge-morning-rule"
      description         = "毎朝8:55にLambdaを実行"
      schedule_expression = "cron(55 23 * * ? *)" # 毎朝8:55
      target_lambda_arn   = data.terraform_remote_state.lambda.outputs.lambda_arns["rss-check-rss-feed-lambda"]
      target_lambda_name  = data.terraform_remote_state.lambda.outputs.lambda_names["rss-check-rss-feed-lambda"]
    },
    evening_rule = {
      rule_name           = "rss-feed-eventbridge-evening-rule"
      description         = "毎日17:30にLambdaを実行"
      schedule_expression = "cron(30 8 * * ? *)" # 毎日17:30
      target_lambda_arn   = data.terraform_remote_state.lambda.outputs.lambda_arns["rss-push-sns-topic-lambda"]
      target_lambda_name  = data.terraform_remote_state.lambda.outputs.lambda_names["rss-push-sns-topic-lambda"]
    }
  }
}
