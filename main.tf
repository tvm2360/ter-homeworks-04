# Инициализация сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.vpc_subnet_a_name
  zone           = var.vpc_subnet_a_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_subnet_a_cidr
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_subnet_b_name
  zone           = var.vpc_subnet_b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_subnet_b_cidr
}

# Инициализация модулей (инстансов)
module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.module_1_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.vpc_subnet_a_zone,var.vpc_subnet_b_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
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
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.module_2_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.vpc_subnet_a_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
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

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username            = var.cloudinit_user_name
    ssh_public_key      = local.ssh_pub_key
  }
}
