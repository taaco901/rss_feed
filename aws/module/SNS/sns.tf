resource "aws_sns_topic" "rss_topic" {
  name = var.topic_name
  tags = {
    Name = var.topic_name
  }
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.rss_topic.arn
  protocol  = var.protocol
  endpoint  = var.email_address
}

resource "aws_sns_topic_policy" "rss_topic_policy" {
  arn    = aws_sns_topic.rss_topic.arn
  policy = var.rss_policy
}
