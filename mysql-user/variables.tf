# Переменные для MySQL User модуля

variable "mod_mysql_cluster_id" {
  type        = string
  description = "HA MySQL cluster id"
}

variable "mod_mysql_cluster_database_name" {
  type        = string
  description = "HA MySQL cluster Database Name"
}

variable "mod_mysql_cluster_username" {
  type        = string
  description = "HA MySQL cluster username"
  sensitive = true
}

variable "mod_mysql_cluster_password" {
  type        = string
  description = "HA MySQL cluster password"
  sensitive = true
}
