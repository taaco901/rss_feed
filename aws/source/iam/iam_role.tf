module "rss_feed_lambda_iam_role" {
  source             = "../../module/IAM_role"
  role_name          = local.role_settings.rss_iam_settings.role_name
  assume_role_policy = local.role_settings.rss_iam_settings.assume_role_policy
}
resource "aws_iam_role_policy_attachment" "rss_feed_lambda_iam_policy_attachment_with_cloudwatch_access" {
  policy_arn = module.CloudWatchAccess_policy.iam_policy_arn
  role       = module.rss_feed_lambda_iam_role.iam_role_name
}
resource "aws_iam_role_policy_attachment" "rss_feed_lambda_iam_policy_attachment_with_access_sns" {
  policy_arn = module.CloudWatchAccess_policy.iam_policy_arn
  role       = module.rss_feed_lambda_iam_role.iam_role_name
}


module "rss_sns_lambda_iam_role" {
  source             = "../../module/IAM_role"
  role_name          = local.role_settings.sns_iam_settings.role_name
  assume_role_policy = local.role_settings.sns_iam_settings.assume_role_policy
}
resource "aws_iam_role_policy_attachment" "rss_sns_lambda_iam_role_policy_attachment_with_cloudwatch_access" {
  policy_arn = module.CloudWatchAccess_policy.iam_policy_arn
  role       = module.rss_sns_lambda_iam_role.iam_role_name
}
