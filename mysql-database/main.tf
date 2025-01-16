# MySQL модуль
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_mdb_mysql_database" "db" {
  cluster_id = var.mod_mysql_cluster_id
  name       = var.mod_mysql_cluster_db_name
}

