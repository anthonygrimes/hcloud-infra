module "zone" {
  source = "./modules/zone"

  managed_domain = var.managed_domain
}

module "certificate" {
  source     = "./modules/certificate"
  depends_on = [module.zone]

  managed_domain = var.managed_domain
}

module "network" {
  source = "./modules/network"

  network_ip_range        = var.network_ip_range
  network_subnet_ip_range = var.network_subnet_ip_range
  network_subnet_zone     = var.network_subnet_zone
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  lb_type                = var.lb_type
  location               = var.location
  managed_certificate_id = module.certificate.certificate_id
  network_subnet_id      = module.network.network_subnet_id
  server_ids             = module.node.manager_worker_ids
}

module "firewall" {
  source     = "./modules/firewall"
  depends_on = [module.network]

  bastion_ipv4_address          = module.node.bastion_ipv4_address
  manager_worker_ipv4_addresses = module.node.manager_worker_ipv4_addresses
  network_subnet_ip_range       = var.network_subnet_ip_range
}

module "ssh" {
  source = "./modules/ssh"

  admin_public_ssh_key = var.admin_public_ssh_key
}

module "node" {
  source     = "./modules/node"
  depends_on = [module.network, module.ssh]

  admin_public_ssh_key       = var.admin_public_ssh_key
  admin_public_ssh_key_id    = module.ssh.admin_public_ssh_key_id
  automation_public_ssh_key  = var.automation_public_ssh_key
  bastion_firewall_id        = module.firewall.bastion_firewall_id
  bastion_type               = var.bastion_type
  db_firewall_id             = module.firewall.db_firewall_id
  db_type                    = var.db_type
  location                   = var.location
  machine_image              = var.machine_image
  manager_worker_count       = var.manager_worker_count
  manager_worker_firewall_id = module.firewall.manager_worker_firewall_id
  manager_worker_type        = var.manager_worker_type
  network_id                 = module.network.network_id
}
