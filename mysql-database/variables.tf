# Переменные для MySQL Database модуля

variable "mod_mysql_cluster_id" {
  type        = string
  description = "HA MySQL cluster id"
}

variable "mod_mysql_cluster_db_name" {
  type        = string
  description = "HA MySQL cluster database name"
}
