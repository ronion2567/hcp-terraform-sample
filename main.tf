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

resource "random_pet" "server_name2" {
  length    = 5
  separator = "-"
}

resource "random_pet" "server_name3" {
  length    = 5
  separator = "-"
}


output "generated_password" {
  value       = random_password.db_password.result
  sensitive   = true
  description = "test"
}

output "generated_server_name" {
  value = random_pet.server_name.id
}
