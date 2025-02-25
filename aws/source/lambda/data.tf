data "terraform_remote_state" "lambda_iam_role_arn" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_iam.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "lambda_feedparser_layer" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_lambda_layer.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "s3_bucket" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_s3.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "sns_topic_arn" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_sns.tfstate"
    region = "ap-northeast-1"
  }
}
