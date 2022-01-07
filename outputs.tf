output "hvn_route_self_link" {
  description = "A unique URL identifying the HVN route."
  value       = hcp_hvn_route.this[9].self_link
}