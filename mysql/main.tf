# MySQL модуль
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_mdb_mysql_cluster" "my-mysql" {
  name                = var.mod_cluster_name
  environment         = var.mod_cluster_environment
  network_id          = var.mod_cluster_network_id
  version             = var.mod_cluster_mysql_version
  security_group_ids  = [yandex_vpc_security_group.mysql-sg.id]
  deletion_protection = var.mod_cluster_mysql_delete_protection

  resources {
    resource_preset_id = local.mod_cluster_resources.resource_preset_id
    disk_type_id       = local.mod_cluster_resources.disk_type_id
    disk_size          = local.mod_cluster_resources.disk_size
  }

  dynamic "host" {
    for_each = range(var.mod_cluster_HA ? var.mod_cluster_HA_number_hosts : 1)
    content {
      zone      = var.mod_cluster_zone
      subnet_id = var.mod_cluster_subnet_id
    }
  }
}



resource "yandex_vpc_security_group" "mysql-sg" {
  name       = local.mod_cluster_sg.name
  network_id = var.mod_cluster_network_id

  ingress {
    description    = local.mod_cluster_sg.ingress_description
    port           = local.mod_cluster_sg.ingress_port
    protocol       = local.mod_cluster_sg.ingress_protocol
    v4_cidr_blocks = local.mod_cluster_sg.ingress_cidr
  }
}


#resource "yandex_mdb_mysql_database" "db1" {
#  cluster_id = yandex_mdb_mysql_cluster.my-mysql.id
#  name       = "db1"
#}

#resource "yandex_mdb_mysql_user" "<имя_пользователя>" {
#  cluster_id = yandex_mdb_mysql_cluster.my-mysql.id
#  name       = "user1"
#  password   = "user1user1"
#  permission {
#    database_name = yandex_mdb_mysql_database.db1.name
#    roles         = ["ALL"]
#  }
#}

