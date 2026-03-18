variable "hcloud_token" {
  sensitive = true
  type      = string
}

# Domain Configuration
variable "managed_domain" {
  type = string
}

# Deployment Location Configuration
variable "location" {
  type    = string
  default = "fsn1"
}

# Network Configuration
variable "network_ip_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "network_subnet_zone" {
  type    = string
  default = "eu-central"
}

variable "network_subnet_ip_range" {
  type    = string
  default = "10.0.1.0/24"
}

# SSH Configuration
variable "admin_public_ssh_key" {
  type = string
}

variable "automation_public_ssh_key" {
  type = string
}

# Loadbalancer Configuration
variable "lb_type" {
  type    = string
  default = "lb11"
}

# Node Configuration
variable "machine_image" {
  type    = string
  default = "rocky-10"
}

# Bastion Node Specific Configuration
variable "bastion_type" {
  type    = string
  default = "cx23"
}

# Manager-Worker Node Specific Configuration
variable "manager_worker_count" {
  type    = number
  default = 3
}

variable "manager_worker_type" {
  type    = string
  default = "cx23"
}

# DB Node Specific Configuration
variable "db_type" {
  type    = string
  default = "cx23"
}
