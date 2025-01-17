# Присвоение значений переменным для инициализации сети
#vpc_name = "develop"
vpc_subnet_a_name = "develop-ru-central1-a"
vpc_subnet_b_name = "develop-ru-central1-b"
#vpc_subnet_mysql_name = "develop-mysql"
#vpc_subnet_a_zone = "ru-central1-a"
#vpc_subnet_b_zone = "ru-central1-b"
#vpc_subnet_a_cidr = ["10.0.1.0/24"]
#vpc_subnet_b_cidr = ["10.0.2.0/24"]

vpc_subnet_a_zone_with_cidr = [
  { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
  { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
]

vpc_subnet_b_zone_with_cidr = [
  { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
]

#vpc_subnet_mysql_zone_with_cidr = [
#  { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#  { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
#  { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
#]
