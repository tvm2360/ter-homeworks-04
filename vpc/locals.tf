# Локальные переменные модуля
locals {
   mod_vpc_subnet_name = "${var.mod_vpc_name}-${var.mod_vpc_subnet_zone}"
}
