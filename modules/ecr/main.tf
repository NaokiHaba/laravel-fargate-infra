// thisとは、このリソース自身を指す。このリソースの属性を参照する場合に使う。
resource "aws_ecr_repository" "this" {
  name = var.name

  tags = {
    Name = var.name
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  policy = jsonencode({
    rules = [
      {
        // rulePriority: ルールの優先順位。数値が小さいほど優先される。
        rulePriority = 1
        // description: ルールの説明
        description  = "Hold only ${var.holding_count} images,expire all others",
        // selection: ルールの適用対象を指定する。
        selection    = {
          // tagStatus: タグの状態を指定する。"tagged" or "untagged" or "any"
          tagStatus   = "any"
          // countType: イメージの数を指定する。"imageCountMoreThan" or "sinceImagePushed"
          countType   = "imageCountMoreThan"
          // countNumber: イメージの数を指定する。数値
          countNumber = var.holding_count
        }
        // action: ルールのアクションを指定する。
        action = {
          type = "expire"
        }
      }
    ]
  })
  // repository: リポジトリを指定する。
  repository = aws_ecr_repository.this.name
}