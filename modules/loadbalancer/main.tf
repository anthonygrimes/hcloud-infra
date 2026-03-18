resource "hcloud_load_balancer" "load_balancer" {
  name               = "node-loadbalancer"
  load_balancer_type = var.lb_type
  location           = var.location
  algorithm {
    type = "round_robin"
  }
}

resource "hcloud_load_balancer_network" "load_balancer_network_attachment" {
  load_balancer_id = hcloud_load_balancer.load_balancer.id
  subnet_id        = var.network_subnet_id
}

resource "hcloud_load_balancer_target" "load_balancer_target" {
  for_each = { for id in var.server_ids : id => id }

  type             = "server"
  load_balancer_id = hcloud_load_balancer.load_balancer.id
  server_id        = each.key
  use_private_ip   = true
}

resource "hcloud_load_balancer_service" "load_balancer_service" {
  load_balancer_id = hcloud_load_balancer.load_balancer.id
  protocol         = "https"
  listen_port      = 443
  destination_port = 8080

  http {
    redirect_http = true
    certificates  = [var.managed_certificate_id]
  }

  health_check {
    protocol = "http"
    port     = 8082
    interval = 15
    timeout  = 10
    retries  = 3
    http {
      path         = "/actuator/liveness"
      response     = "UP"
      tls          = false
      status_codes = ["200"]
    }
  }
}
