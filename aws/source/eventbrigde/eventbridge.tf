module "rss_feed_kick_eventbridge" {
  source = "../../module/eventbrigde"

  for_each = local.eventbridge_settings

  ev_rule_name        = each.value.rule_name
  ev_description      = each.value.description
  schedule_expression = each.value.schedule_expression
  lambda_arn          = each.value.target_lambda_arn
  lambda_name         = each.value.target_lambda_name
}
