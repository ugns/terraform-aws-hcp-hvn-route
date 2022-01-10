output "hvn_route_self_link" {
  description = "A unique URL identifying the HVN route."
  value       = hcp_hvn_route.this[0].self_link
}

output "hcp_hvn_destination_cidr" {
  description = "The destination CIDR of the HVN route."
  value       = var.hcp_hvn_destination_cidr
}
