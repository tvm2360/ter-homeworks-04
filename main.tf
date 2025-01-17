# Инициализация сети

#resource "yandex_vpc_network" "develop" {
#  name = var.vpc_name
#}

#resource "yandex_vpc_subnet" "develop_a" {
#  name           = var.vpc_subnet_a_name
#  zone           = var.vpc_subnet_a_zone
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.vpc_subnet_a_cidr
#}

#resource "yandex_vpc_subnet" "develop_b" {
#  name           = var.vpc_subnet_b_name
#  zone           = var.vpc_subnet_b_zone
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.vpc_subnet_b_cidr
#}

module "develop_a" {
  source       = "./vpc"
  mod_vpc_name = var.vpc_subnet_a_name
#  mod_vpc_subnet_zone           = var.vpc_subnet_a_zone
#  mod_vpc_subnet_cidr           = var.vpc_subnet_a_cidr
  mod_vpc_subnet_zone_with_cidr = var.vpc_subnet_a_zone_with_cidr
}

module "develop_b" {
  source       = "./vpc"
  mod_vpc_name = var.vpc_subnet_b_name
#  mod_vpc_subnet_zone           = var.vpc_subnet_b_zone
#  mod_vpc_subnet_cidr           = var.vpc_subnet_b_cidr
  mod_vpc_subnet_zone_with_cidr = var.vpc_subnet_b_zone_with_cidr
}


# Инициализация модулей (инстансов)
module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=dev"
  env_name       = var.module_1_env_name
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.develop_a.network_id
#  subnet_zones   = [var.vpc_subnet_a_zone,var.vpc_subnet_b_zone]
  subnet_zones   = module.develop_a.subnet_zones
#  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
#  subnet_ids     = [module.develop_a.subnet_id,module.develop_b.subnet_id]
  subnet_ids     = module.develop_a.subnet_id


  instance_name  = var.module_1_instance_name
  instance_count = var.module_1_instance_count
  image_family   = var.module_1_image_family
  public_ip      = var.module_1_public_ip
  labels = {
    label = var.module_1_label
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.module_1_serial-port
  }
}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=dev"
  env_name       = var.module_2_env_name
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.develop_b.network_id
#  subnet_zones   = [var.vpc_subnet_a_zone]
  subnet_zones   = module.develop_b.subnet_zones
#  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
#  subnet_ids     = [module.develop_a.subnet_id]
  subnet_ids     = module.develop_b.subnet_id


  instance_name  = var.module_2_instance_name
  instance_count = var.module_2_instance_count
  image_family   = var.module_2_image_family
  public_ip      = var.module_2_public_ip
  labels = {
    label = var.module_2_label
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.module_2_serial-port
  }
}

module "mysql-develop" {
  source       = "./mysql"
  mod_cluster_name            = var.mysql_cluster_name
  mod_cluster_network_id      = module.develop_a.network_id
  mod_cluster_subnet_id       = module.develop_a.subnet_id[0]
  mod_cluster_zone            = module.develop_a.subnet_zones[0]
  mod_cluster_HA              = var.mysql_cluster_HA
#  mod_cluster_HA_number_hosts = 3
}

module "mysql-develop-database" {
  source       = "./mysql-database"
  mod_mysql_cluster_id      = module.mysql-develop.mysql_cluster_id
  mod_mysql_cluster_db_name = var.mysql_cluster_db_name
}

module "mysql-develop-user" {
  source       = "./mysql-user"
  mod_mysql_cluster_id               = module.mysql-develop.mysql_cluster_id
  mod_mysql_cluster_database_name    = var.mysql_cluster_db_name
  mod_mysql_cluster_username         = var.mysql_cluster_username
  mod_mysql_cluster_password         = var.mysql_cluster_password
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username            = var.cloudinit_user_name
    ssh_public_key      = local.ssh_pub_key
  }
}
