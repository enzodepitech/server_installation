output "guacamole_container_ip" {
  description = "The internal IP address of the Guacamole container"
  value       = proxmox_virtual_environment_container.guacamole.initialization[0].ip_config[0].ipv4[0].address
}

output "guacamole_web_url" {
  description = "The internal web access URL for Guacamole"
  value       = "http://${proxmox_virtual_environment_container.guacamole.initialization[0].ip_config[0].ipv4[0].address}:8080/guacamole"
}