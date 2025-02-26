terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "rssfeed-terraform"
    key    = "GCP/terraform_CloudScheduler.tfstate"
    region = "ap-northeast-1"
  }
}

provider "google" {
  project = "rss-feed-452016"
  region  = "asia-northeast1"
  default_labels = {
    system_name = "rss"
    Project     = "rss"
  }
}
