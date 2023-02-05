terraform {
  # backend機構をs3に指定
  # backend機構とは、Terraformの状態を保存する場所を指定する機構
  backend "s3" {
    # bucketはS3のバケット名
    bucket = "naokiaba-tsstate"
    # keyはS3のオブジェクトキー
    key = "example/prod/app/foobar_v1.0.0.tfstate"
    # regionはS3のリージョン
    region = "ap-northeast-1"
  }
}