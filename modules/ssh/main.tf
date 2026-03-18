resource "hcloud_ssh_key" "admin_public_ssh_key" {
  name       = "admin-key"
  public_key = var.admin_public_ssh_key
}
