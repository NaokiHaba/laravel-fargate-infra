// variableは、モジュールの外部から値を渡すための仕組み
variable "name" {
  type = string
}

variable "holding_count" {
  type = number
  default = 10
}
