resource "hcloud_firewall" "bastion_firewall" {
  name = "bastion-firewall"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_firewall" "manager_worker_firewall" {
  name = "manager-worker-firewall"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8080"
    source_ips = [
      var.bastion_ipv4_address,
      var.network_subnet_ip_range
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8082"
    source_ips = [
      var.bastion_ipv4_address,
      var.network_subnet_ip_range
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      var.bastion_ipv4_address,
      var.network_subnet_ip_range
    ]
  }
}

resource "hcloud_firewall" "db_firewall" {
  name = "db-firewall"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "5432"
    source_ips = concat(
      [var.bastion_ipv4_address, var.network_subnet_ip_range],
      var.manager_worker_ipv4_addresses
    )
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      var.bastion_ipv4_address,
      var.network_subnet_ip_range
    ]
  }
}
