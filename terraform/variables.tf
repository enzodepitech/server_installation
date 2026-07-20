variable "proxmox_node" {
  type        = string
  default     = "pve"
  description = "The target Proxmox hypervisor node name"
}

variable "ssh_public_key" {
  type        = string
  sensitive   = true
  description = "Public SSH key to inject into created LXC containers"
  default = "~/.ssh/id_rsa.pub"
}