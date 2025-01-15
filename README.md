# ter-homeworks-04

## Задание 1

cloud-init.yml:

``` terraform
#cloud-config
users:
  - default
  - name: ${username}
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_public_key}

package_update: true
package_upgrade: false
packages:
  - vim
  - nginx
```

ВМ с метками:

![VMs](./pictures/1_VM_with_labels.png)

Инстансы:

![Instances](./pictures/1_instance_list.png)

<table>
  <tr>
    <td>develop-webs-0</td>
    <td><img src="./pictures/1_develop-webs-0.png" width=890 height=170></td>
  </tr>
  <tr>
    <td>develop-webs-1</td>
    <td><img src="./pictures/1_develop-webs-1.png" width=890 height=170></td>
  </tr>
  <tr>
    <td>stage-web-stage-0</td>
    <td><img src="./pictures/1_stage-web-stage-0.png" width=890 height=170></td>
  </tr>
</table>

terraform console:

![Terraform_console](./pictures/1_Terraform_console.png)




