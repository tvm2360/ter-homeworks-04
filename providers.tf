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

terraform {
#  required_version = "1.8.4"

  backend "s3" {
    shared_credentials_files = ["~/.aws/credentials"]
    shared_config_files = [ "~/.aws/config" ]
    profile = "default"
    region="ru-central1"
    bucket   = "tvm2360-tfstate"
    key      = "..../terraform.tfstate"
    access_key                  = "Qq"
    secret_key                  = "Qq"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

  endpoints ={
    dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/QqQqQqQqQqQq"
    s3 = "https://storage.yandexcloud.net"
  }

    dynamodb_table              = "tvm2360-tfstate-lock"
  }

#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.118.0"
#    }
#  }
}
