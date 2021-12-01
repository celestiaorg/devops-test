terraform {
  required_providers {
    /*
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    */
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
/*
provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
*/

resource "digitalocean_kubernetes_cluster" "foo" {
  name   = "foo"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}