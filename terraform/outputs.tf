output "nginx_proxy_manager_ip" {
  description = "IP address of Nginx Proxy Manager"
  value       = proxmox_virtual_environment_container.nginxpm.initialization[0].ip_config[0].ipv4[0].address
}

output "guacamole_ip" {
  description = "IP address of Guacamole"
  value       = proxmox_virtual_environment_container.guacamole.initialization[0].ip_config[0].ipv4[0].address
}

output "guacamole_web_url" {
  description = "URL for Guacamole"
  value       = "http://${proxmox_virtual_environment_container.guacamole.initialization[0].ip_config[0].ipv4[0].address}:8080/guacamole"
}