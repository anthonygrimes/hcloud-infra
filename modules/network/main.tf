resource "hcloud_network" "network" {
  name     = "network"
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "network_subnet" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = var.network_subnet_zone
  ip_range     = var.network_subnet_ip_range
}
