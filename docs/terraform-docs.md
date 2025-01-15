<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_develop_a"></a> [develop\_a](#module\_develop\_a) | ./vpc | n/a |
| <a name="module_develop_b"></a> [develop\_b](#module\_develop\_b) | ./vpc | n/a |
| <a name="module_example-vm"></a> [example-vm](#module\_example-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_cloudinit_user_name"></a> [cloudinit\_user\_name](#input\_cloudinit\_user\_name) | User name for cloud-init.yaml | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_module_1_env_name"></a> [module\_1\_env\_name](#input\_module\_1\_env\_name) | Environment name for module test-vm | `string` | n/a | yes |
| <a name="input_module_1_image_family"></a> [module\_1\_image\_family](#input\_module\_1\_image\_family) | Image family for module test-vm | `string` | `"ubuntu-2204-lts"` | no |
| <a name="input_module_1_instance_count"></a> [module\_1\_instance\_count](#input\_module\_1\_instance\_count) | Number of instance for module test-vm | `number` | n/a | yes |
| <a name="input_module_1_instance_name"></a> [module\_1\_instance\_name](#input\_module\_1\_instance\_name) | Instance name for module test-vm | `string` | n/a | yes |
| <a name="input_module_1_label"></a> [module\_1\_label](#input\_module\_1\_label) | Label name for module test-vm | `string` | n/a | yes |
| <a name="input_module_1_public_ip"></a> [module\_1\_public\_ip](#input\_module\_1\_public\_ip) | Module test-vm with public ip | `bool` | `true` | no |
| <a name="input_module_1_serial-port"></a> [module\_1\_serial-port](#input\_module\_1\_serial-port) | Serial port on module test-vm is enable | `number` | `1` | no |
| <a name="input_module_2_env_name"></a> [module\_2\_env\_name](#input\_module\_2\_env\_name) | Environment name for module example-vm | `string` | n/a | yes |
| <a name="input_module_2_image_family"></a> [module\_2\_image\_family](#input\_module\_2\_image\_family) | Image family for module example-vm | `string` | `"ubuntu-2204-lts"` | no |
| <a name="input_module_2_instance_count"></a> [module\_2\_instance\_count](#input\_module\_2\_instance\_count) | Number of instance for module example-vm | `number` | n/a | yes |
| <a name="input_module_2_instance_name"></a> [module\_2\_instance\_name](#input\_module\_2\_instance\_name) | Instance name for module example-vm | `string` | n/a | yes |
| <a name="input_module_2_label"></a> [module\_2\_label](#input\_module\_2\_label) | Label name for module example-vm | `string` | n/a | yes |
| <a name="input_module_2_public_ip"></a> [module\_2\_public\_ip](#input\_module\_2\_public\_ip) | Module example-vm with public ip | `bool` | `true` | no |
| <a name="input_module_2_serial-port"></a> [module\_2\_serial-port](#input\_module\_2\_serial-port) | Serial port on module example-vm is enable | `number` | `1` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |
| <a name="input_vpc_subnet_a_cidr"></a> [vpc\_subnet\_a\_cidr](#input\_vpc\_subnet\_a\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_a_name"></a> [vpc\_subnet\_a\_name](#input\_vpc\_subnet\_a\_name) | VPC subnet 'a' name | `string` | n/a | yes |
| <a name="input_vpc_subnet_a_zone"></a> [vpc\_subnet\_a\_zone](#input\_vpc\_subnet\_a\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | n/a | yes |
| <a name="input_vpc_subnet_b_cidr"></a> [vpc\_subnet\_b\_cidr](#input\_vpc\_subnet\_b\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_b_name"></a> [vpc\_subnet\_b\_name](#input\_vpc\_subnet\_b\_name) | VPC subnet 'b' name | `string` | n/a | yes |
| <a name="input_vpc_subnet_b_zone"></a> [vpc\_subnet\_b\_zone](#input\_vpc\_subnet\_b\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out"></a> [out](#output\_out) | n/a |
<!-- END_TF_DOCS -->