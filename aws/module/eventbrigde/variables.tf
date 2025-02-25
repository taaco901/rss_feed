variable "ev_rule_name" {
  type    = string
  default = "rss_feed_event_rule"
}
variable "ev_description" {
  type    = string
  default = ""
}

variable "schedule_expression" {
  type    = string
  default = "rate(60 minutes)"
}
variable "ev_target_id" {
  type    = string
  default = "lambda"
}

variable "lambda_permission" {
  type    = string
  default = "AllowExecutionFromCloudWatch"
}
variable "lambda_action" {
  type    = string
  default = "lambda:InvokeFunction"
}
variable "lambda_principal" {
  type    = string
  default = "events.amazonaws.com"
}

variable "lambda_arn" {
  type = string
}
variable "lambda_name" {
  type = string
}
