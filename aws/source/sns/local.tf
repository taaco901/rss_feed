locals {
  sns_settings = {
    topic_name = "rss-feed-topic"
    rss_policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Sid    = "AllowLambdaPublish",
          Effect = "Allow",
          Principal = {
            Service = "lambda.amazonaws.com"
          },
          Action   = "sns:Publish",
          Resource = module.aws_sns_topic.sns_topic_arn
        }
      ]
    })
  }
}

variable "email_address" {
  description = "メールアドレス"
  type        = string
  sensitive   = true
}
