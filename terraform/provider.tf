terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.111.1"
    }
  }
}

provider "proxmox" {
  endpoint = "https://10.17.73.2:8006/"
  insecure = true
  api_token = var.proxmox_api_token
}