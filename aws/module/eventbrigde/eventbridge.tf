resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = var.ev_rule_name
  description         = "RSS feed event rule"
  schedule_expression = "rate(5 minutes)"
  tags = {
    Name = var.ev_rule_name
  }
}

resource "aws_cloudwatch_event_target" "event_bridge" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  target_id = "lambda"
  arn       = var.lambda_arn

}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
