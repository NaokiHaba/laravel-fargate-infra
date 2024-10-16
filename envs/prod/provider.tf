provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Environment = "prod"
      Project = "example"
    }
  }
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }

    required_version = "~> 1.9.5"
}
