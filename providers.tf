# Инициализация провайдеров
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

provider "yandex" {
  service_account_key_file = local.sa_key
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
