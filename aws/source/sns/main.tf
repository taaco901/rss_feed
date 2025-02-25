terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_sns.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  default_tags {
    tags = {
      awsApplication = "arn:aws:resource-groups:ap-northeast-1:729559450977:group/RSS_FEED/00uhs7sxokvxxyszh3576iirh4"
      system_name    = "rss"
      Project        = "rss"
    }
  }
}
