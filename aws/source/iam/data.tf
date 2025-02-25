
data "terraform_remote_state" "s3_bucket" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_s3.tfstate"
    region = "ap-northeast-1"
  }
}
