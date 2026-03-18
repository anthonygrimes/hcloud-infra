# Bastion Node Output
output "bastion_ipv4_address" {
  value = hcloud_server.bastion_node.ipv4_address
}

output "bastion_private_ip_address" {
  value = tolist(hcloud_server.bastion_node.network)[0].ip
}

# Manager-Worker Nodes Output
output "manager_worker_ids" {
  value = hcloud_server.manager_worker_node[*].id
}

output "manager_worker_ipv4_addresses" {
  value = hcloud_server.manager_worker_node[*].ipv4_address
}

output "manager_worker_private_addresses" {
  value = flatten([
    for server in hcloud_server.manager_worker_node : tolist(server.network)[0].ip
  ])
}

# DB Node Output
output "db_private_ip_address" {
  value = tolist(hcloud_server.db_node.network)[0].ip
}
