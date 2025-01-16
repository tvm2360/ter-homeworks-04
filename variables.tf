### Переменные для доступа в yandex cloud

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# Переменные для инициализации сети

variable "vpc_name" {
  type        = string
  description = "VPC name"
}
variable "vpc_subnet_a_name" {
  type        = string
  description = "VPC subnet 'a' name"
}
variable "vpc_subnet_b_name" {
  type        = string
  description = "VPC subnet 'b' name"
}

#variable "vpc_subnet_a_zone" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}
#variable "vpc_subnet_b_zone" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}
#variable "vpc_subnet_a_cidr" {
#  type        = list(string)
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}
#variable "vpc_subnet_b_cidr" {
#  type        = list(string)
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}

variable "vpc_subnet_a_zone_with_cidr" {
  type        = list(object({
    zone      = string
    cidr      = string
  }))
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope | https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_subnet_b_zone_with_cidr" {
  type        = list(object({
    zone      = string
    cidr      = string
  }))
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope | https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

### Переменные для модуля test-vm (инициализация инстанса)

variable "module_1_env_name" {
  type        = string
  description = "Environment name for module test-vm "
}
variable "module_1_instance_name" {
  type        = string
  description = "Instance name for module test-vm "
}
variable "module_1_instance_count" {
  type        = number
  description = "Number of instance for module test-vm "
}
variable "module_1_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Image family for module test-vm "
}
variable "module_1_public_ip" {
  type        = bool
  default     = true
  description = "Module test-vm with public ip"
}
variable "module_1_label" {
  type        = string
  description = "Label name for module test-vm "
}
variable "module_1_serial-port" {
  type        = number
  default     = 1
  description = "Serial port on module test-vm is enable"
}

### Переменные для модуля example (инициализация инстанса)

variable "module_2_env_name" {
  type        = string
  description = "Environment name for module example-vm "
}
variable "module_2_instance_name" {
  type        = string
  description = "Instance name for module example-vm "
}
variable "module_2_instance_count" {
  type        = number
  description = "Number of instance for module example-vm "
}
variable "module_2_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Image family for module example-vm "
}
variable "module_2_public_ip" {
  type        = bool
  default     = true
  description = "Module example-vm with public ip"
}
variable "module_2_label" {
  type        = string
  description = "Label name for module example-vm "
}
variable "module_2_serial-port" {
  type        = number
  default     = 1
  description = "Serial port on module example-vm is enable"
}

### Переменные для cloud-init.yaml

variable "cloudinit_user_name" {
  type        = string
  description = "User name for cloud-init.yaml"
}
