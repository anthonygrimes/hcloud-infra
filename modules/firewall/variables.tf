variable "network_subnet_ip_range" {
  type = string
}

variable "bastion_ipv4_address" {
  type = string
}

variable "manager_worker_ipv4_addresses" {
  type = list(string)
}
