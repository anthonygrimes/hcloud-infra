resource "hcloud_zone" "zone" {
  mode = "primary"
  name = var.managed_domain
}
