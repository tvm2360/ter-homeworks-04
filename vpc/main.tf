# Инициализация сети через модуль

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_vpc_network" "mod_vpc" {
  name = var.mod_vpc_name
}

resource "yandex_vpc_subnet" "mod_vpc_subnet" {
  name           = local.mod_vpc_subnet_name
  zone           = var.mod_vpc_subnet_zone
  network_id     = yandex_vpc_network.mod_vpc.id
  v4_cidr_blocks = var.mod_vpc_subnet_cidr
}

