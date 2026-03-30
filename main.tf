terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

resource "random_password" "db_password" {
  length           = 13
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_pet" "server_name" {
  length    = 5
  separator = "-"
}

# 👇 Apply中に失敗させるリソース
resource "null_resource" "force_failure" {
  provisioner "local-exec" {
    command = "exit 1"
  }
}

output "generated_password" {
  value     = random_password.db_password.result
  sensitive = true
}

output "generated_server_name" {
  value = random_pet.server_name.id
}
