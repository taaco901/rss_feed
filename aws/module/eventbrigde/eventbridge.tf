resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = var.ev_rule_name
  description         = var.ev_description
  schedule_expression = var.schedule_expression
  tags = {
    Name = var.ev_rule_name
  }
}

resource "aws_cloudwatch_event_target" "event_bridge" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  target_id = var.ev_target_id
  arn       = var.lambda_arn
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = var.lambda_permission
  action        = var.lambda_action
  function_name = var.lambda_name
  principal     = var.lambda_principal
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
