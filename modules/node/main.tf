locals {
  cloud_config = templatefile(
    "${path.module}/cloud-init/cloud-config.tftpl",
    {
      admin_public_ssh_key      = var.admin_public_ssh_key
      automation_public_ssh_key = var.automation_public_ssh_key
    }
  )
}

resource "hcloud_placement_group" "placement_group" {
  name = "placement-group"
  type = "spread"
}

resource "hcloud_server" "bastion_node" {
  name               = "bastion"
  server_type        = var.bastion_type
  image              = var.machine_image
  location           = var.location
  backups            = true
  firewall_ids       = [var.bastion_firewall_id]
  placement_group_id = hcloud_placement_group.placement_group.id
  ssh_keys           = [var.admin_public_ssh_key_id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  network {
    network_id = var.network_id
    alias_ips  = []
  }

  user_data = local.cloud_config

  depends_on = [
    hcloud_placement_group.placement_group,
  ]
}

resource "hcloud_server" "manager_worker_node" {
  count = var.manager_worker_count

  name               = "wm-${count.index}"
  server_type        = var.manager_worker_type
  image              = var.machine_image
  location           = var.location
  placement_group_id = hcloud_placement_group.placement_group.id
  firewall_ids       = [var.manager_worker_firewall_id]
  ssh_keys           = [var.admin_public_ssh_key_id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  network {
    network_id = var.network_id
    alias_ips  = []
  }

  user_data = local.cloud_config

  depends_on = [
    hcloud_placement_group.placement_group,
  ]
}

resource "hcloud_server" "db_node" {
  name               = "db"
  server_type        = var.db_type
  image              = var.machine_image
  location           = var.location
  backups            = true
  placement_group_id = hcloud_placement_group.placement_group.id
  firewall_ids       = [var.db_firewall_id]
  ssh_keys           = [var.admin_public_ssh_key_id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  network {
    network_id = var.network_id
    alias_ips  = []
  }

  user_data = local.cloud_config

  depends_on = [
    hcloud_placement_group.placement_group,
  ]
}
