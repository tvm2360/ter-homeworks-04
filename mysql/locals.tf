locals {
  mod_cluster_resources = {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-hdd"
    disk_size          = 20
  }
}

locals {
  mod_cluster_sg = {
    name                   = "mysql-sg"
    ingress_description    = "MySQL"
    ingress_port           = 3306
    ingress_protocol       = "TCP"
    ingress_cidr           = [ "0.0.0.0/0" ]
  }
}



