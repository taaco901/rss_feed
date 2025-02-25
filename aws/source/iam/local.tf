# RSS Feed Lambda IAM Settings
locals {
  role_settings = {
    rss_iam_settings = {
      role_name = "rss-lambda-role"
      assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [{
          Effect    = "Allow",
          Principal = { Service = "lambda.amazonaws.com" },
          Action    = "sts:AssumeRole"
        }]
      })
    }
    sns_iam_settings = {
      role_name = "sns-lambda-role"
      assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [{
          Effect    = "Allow",
          Principal = { Service = "lambda.amazonaws.com" },
          Action    = "sts:AssumeRole"
        }]
      })
    }
  }
}


locals {
  policy_settings = {
    cloudwatch_access = {
      policy_name = "cloudwatch-policy"
      policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Effect = "Allow",
            Action = [
              "cloudwatch:PutMetricData",
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ],
            Resource = "*"
          }
        ]
      })
    }
    access_sns = {
      policy_name = "sns-lambda-policy"
      policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Effect = "Allow",
            Action = [
              "sns:Publish"
            ],
            Resource = "*"
          }
        ]
      })
    }
    access_s3 = {
      policy_name = "s3-lambda-policy"
      policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Effect = "Allow",
            Action = [
              "s3:GetObject",
              "s3:PutObject",
              "s3:ListBucket"
            ],
            Resource = [
              "${data.terraform_remote_state.s3_bucket.outputs.rss_feed_bucket_arn}/*",
              "${data.terraform_remote_state.s3_bucket.outputs.rss_feed_bucket_arn}"
            ]
          }
        ]
      })
    }
  }
}

