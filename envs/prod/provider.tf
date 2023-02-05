# provider は、Terraform がリソースを作成する先のクラウドサービスを指定する
# 今回は AWS を指定する
provider "aws" {
  # AWS のリージョンを指定する
  regin = "ap-northeast-1"

  # default_tags は、リソースに自動的にタグを付与する
  default_tags {
    tags = {
      Env    = "prod"
      System = "example"
    }
  }
}

terraform {
  # Terraformが使用するプロバイダーとそのバージョンを指定
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }

  # Terraform のバージョンを指定する
  required_version = "1.0.0"
}
