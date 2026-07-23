resource "proxmox_virtual_environment_container" "vmparty" {
  description  = "Managed by Terraform - VM Party (Pool VM Manager)"
  node_name    = "pve"
  vm_id = 123
  unprivileged = true

  initialization {
    hostname = "vm-party"

    ip_config {
      ipv4 {
        address = "192.168.10.103/24"
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