resource "proxmox_virtual_environment_container" "homepage" {
  description  = "Managed by Terraform - Homepage"
  node_name    = "pve"
  vm_id = 122
  unprivileged = true

  initialization {
    hostname = "homepage"

    ip_config {
      ipv4 {
        address = "192.168.10.102/24"
        gateway = "192.168.10.1"
      }
    }

    user_account {
      keys = [
        var.ssh_public_key
      ]
    }
  }

  features {
    nesting = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
    swap      = 512
  }

  disk {
    datastore_id = "local-lvm"
    size         = 4
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  operating_system {
    template_file_id = proxmox_download_file.debian_13_template.id
    type             = "debian"
  }

  start_on_boot = true
  started       = true
}