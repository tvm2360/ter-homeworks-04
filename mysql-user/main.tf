# MySQL модуль
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_mdb_mysql_user" "user1" {
  cluster_id = var.mod_mysql_cluster_id
  name       = var.mod_mysql_cluster_username
  password   = var.mod_mysql_cluster_password
  permission {
    database_name = var.mod_mysql_cluster_database_name
    roles         = local.roles
  }
}

