terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "foo" {
  name   = "foo"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    # List possible slugs with `doctl compute size list`
    size       = "s-2vcpu-2gb"
    # Minimum node_count is 2
    node_count = 2
  }
}