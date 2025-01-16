output "module_vpc_output" {
   value = yandex_vpc_subnet.mod_vpc_subnet
}

output "network_id" {
   value = yandex_vpc_network.mod_vpc.id
}

#output "subnet_id" {
#   value = yandex_vpc_subnet.mod_vpc_subnet.id
#}

output "subnet_id" {
   value = concat( [for k, v in yandex_vpc_subnet.mod_vpc_subnet : format("%s", v.id)] )
}

output "subnet_zones" {
   value = concat( [for k, v in yandex_vpc_subnet.mod_vpc_subnet : format("%s", v.zone)] )
}


