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

resource "digitalocean_droplet" "cluster" {
  image     = "ubuntu-18-04-x64"
  name      = "node0"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
  user_data = file("init-node0.yaml")
  count = 1
}