# 1. 使用するプロバイダーの設定
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# 2. ランダムな文字列の生成（パスワード風）
resource "random_password" "db_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# 3. ランダムなペット名の生成（サーバー名などに便利）
resource "random_pet" "server_name" {
  length    = 5
  separator = "-"
}

# 4. 実行結果の出力
output "generated_password" {
  value     = random_password.db_password.result
  sensitive = true # パスワードなのでコンソール上で隠す設定
}

output "generated_server_name" {
  value = random_pet.server_name.id
}
