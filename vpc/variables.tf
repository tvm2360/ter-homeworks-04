# Переменные для инициализации сети через модуль

variable "mod_vpc_name" {
  type        = string
  default     = ""
  description = "VPC name"
}

#variable "mod_vpc_subnet_zone" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}
#variable "mod_vpc_subnet_cidr" {
#  type        = list(string)
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}

variable "mod_vpc_subnet_zone_with_cidr" {
  type        = list(object({
    zone      = string
    cidr      = string
  }))
  default     = null
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope | https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
