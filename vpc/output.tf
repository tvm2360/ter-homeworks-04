output "module_vpc_output" {
   value = yandex_vpc_subnet.mod_vpc_subnet
}

output "network_id" {
   value = yandex_vpc_network.mod_vpc.id
}

output "subnet_id" {
   value = yandex_vpc_subnet.mod_vpc_subnet.id
}