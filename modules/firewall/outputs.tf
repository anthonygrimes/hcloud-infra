output "bastion_firewall_id" {
  value = hcloud_firewall.bastion_firewall.id
}

output "manager_worker_firewall_id" {
  value = hcloud_firewall.manager_worker_firewall.id
}

output "db_firewall_id" {
  value = hcloud_firewall.db_firewall.id
}
