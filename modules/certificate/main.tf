resource "hcloud_managed_certificate" "public_cert" {
  name         = "public_certificate"
  domain_names = [format("%s%s", "*.", var.managed_domain), var.managed_domain]
}
