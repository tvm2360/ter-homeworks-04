# Переменные для инициализации сети через модуль

variable "mod_vpc_name" {
  type        = string
  description = "VPC name"
}
variable "mod_vpc_subnet_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "mod_vpc_subnet_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

