# Переменные для MySQL модуля

variable "mod_cluster_name" {
  type        = string
  description = "HA MySQL cluster name"
}

variable "mod_cluster_network_id" {
  type        = string
  description = "HA MySQL network id"
}

variable "mod_cluster_subnet_id" {
  type        = string
  description = "HA MySQL subnet id"
}

variable "mod_cluster_zone" {
  type        = string
  description = "HA MySQL zone"
}

variable "mod_cluster_environment" {
  type        = string
  default     = "PRESTABLE"
  description = "HA MySQL environment"
}

variable "mod_cluster_mysql_version" {
  type        = string
  default     = "8.0"
  description = "HA MySQL version"
}

variable "mod_cluster_mysql_delete_protection" {
  type        = bool
  default     = false
  description = "HA MySQL delete protection"
}

variable "mod_cluster_HA" {
  type        = bool
  description = "MySQL cluser is HA?"
}

variable "mod_cluster_HA_number_hosts" {
  type        = number
  default     = 2
  description = "HA MySQL cluster name"
}
