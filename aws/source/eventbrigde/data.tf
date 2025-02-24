data "terraform_remote_state" "lambda" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_lambda.tfstate"
    region = "ap-northeast-1"
  }
}
