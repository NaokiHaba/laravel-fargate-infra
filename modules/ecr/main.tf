resource "aws_ecr_repository" "this" {
  name = var.name

  tags = {
    Name = var.name
  }
}

# 1つしかないものは リソース名 this を使う
resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep only the latest image for each tag",
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": 10
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  })
}