terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://10.17.73.2:8006/"
  insecure = true

  # Set via environment variable:
  # export PROXMOX_VE_API_TOKEN="terraform-user@pve!provider-token=YOUR-SECRET-KEY"
}