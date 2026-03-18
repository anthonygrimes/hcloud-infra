terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.60.1"
    }
  }
  required_version = ">= 1.11.5"
}

provider "hcloud" {
  token = var.hcloud_token
}
