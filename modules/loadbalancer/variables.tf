variable "location" {
  type = string
}

variable "lb_type" {
  type = string
}

variable "network_subnet_id" {
  type = string
}

variable "managed_certificate_id" {
  type = string
}

variable "server_ids" {
  type = list(number)
}
