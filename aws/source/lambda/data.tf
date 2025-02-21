data "terraform_remote_state" "lambda_iam_role_arn" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_iam.tfstate"
    region = "ap-northeast-1"
  }
}
