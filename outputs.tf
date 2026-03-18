# Bastion Node Output
output "bastion_ipv4_address" {
  value = module.node.bastion_ipv4_address
}

output "bastion_private_ip_address" {
  value = module.node.bastion_private_ip_address
}

# Manager-Worker Output
output "manager_worker_ipv4_addresses" {
  value = module.node.manager_worker_ipv4_addresses
}

output "manager_worker_private_ip_addresses" {
  value = module.node.manager_worker_private_addresses
}

# DB Output
output "db_private_ip_address" {
  value = module.node.db_private_ip_address
}
