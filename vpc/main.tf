# Инициализация сети через модуль
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

resource "yandex_vpc_network" "mod_vpc" {
  name = var.mod_vpc_name
}

#resource "yandex_vpc_subnet" "mod_vpc_subnet" {
#  name           = local.mod_vpc_subnet_name
#  zone           = var.mod_vpc_subnet_zone
#  network_id     = yandex_vpc_network.mod_vpc.id
#  v4_cidr_blocks = [ var.mod_vpc_subnet_cidr ]
#}

resource "yandex_vpc_subnet" "mod_vpc_subnet" {
  for_each       = { for k, v in var.mod_vpc_subnet_zone_with_cidr : k => v }
  network_id     = yandex_vpc_network.mod_vpc.id
  zone           = each.value.zone
  v4_cidr_blocks = [ each.value.cidr ]
  name           = lookup(each.value, "name", "develop-${var.mod_vpc_name}-${each.value.zone}-${random_string.random_suffix.result}")
}
