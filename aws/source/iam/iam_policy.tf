module "CloudWatchAccess_policy" {
  source      = "../../module/IAM_policy"
  policy_name = local.policy_settings.cloudwatch_access.policy_name
  policy      = local.policy_settings.cloudwatch_access.policy
}

module "accessSNS_policy" {
  source      = "../../module/IAM_policy"
  policy_name = local.policy_settings.access_sns.policy_name
  policy      = local.policy_settings.access_sns.policy

}

module "accessS3_bucket" {
  source      = "../../module/IAM_policy"
  policy_name = local.policy_settings.access_s3.policy_name
  policy      = local.policy_settings.access_s3.policy

}
