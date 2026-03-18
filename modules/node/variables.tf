# Node Network
variable "network_id" {
  type = string
}

# Node Firewalls
variable "bastion_firewall_id" {
  type = string
}

variable "manager_worker_firewall_id" {
  type = string
}

variable "db_firewall_id" {
  type = string
}

# Node Configuration
variable "location" {
  type = string
}

variable "machine_image" {
  type = string
}

variable "admin_public_ssh_key_id" {
  type = string
}

variable "admin_public_ssh_key" {
  type = string
}

variable "automation_public_ssh_key" {
  type = string
}

# Bastion Node Specific Configuration
variable "bastion_type" {
  type = string
}

# Manager-Worker Node Specific Configuration
variable "manager_worker_count" {
  type = number
}

variable "manager_worker_type" {
  type = string
}

# DB Node Specific Configuration
variable "db_type" {
  type = string
}
