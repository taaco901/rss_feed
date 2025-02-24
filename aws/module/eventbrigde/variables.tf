variable "ev_rule_name" {
  type    = string
  default = "rss_feed_event_rule"
}

variable "schedule_expression" {
  type    = string
  default = "rate(5 minutes)"
}


variable "lambda_arn" {
  type = string
}
variable "lambda_name" {
  type = string
}
