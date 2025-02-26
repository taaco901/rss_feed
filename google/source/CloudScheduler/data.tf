data "terraform_remote_state" "cf_settings" {
  backend = "s3"
  config = {
    bucket = "rssfeed-terraform"
    key    = "GCP/terraform_CloudFunction.tfstate"
    region = "ap-northeast-1"
  }
}

