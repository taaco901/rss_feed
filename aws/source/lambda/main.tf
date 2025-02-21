terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "rssfeed-terraform"
    key    = "aws/terraform_lambda.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  default_tags {
    tags = {
      system_name     = "rss"
      Project     = "rss"
    }
  }
}