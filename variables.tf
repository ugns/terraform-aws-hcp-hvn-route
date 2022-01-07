variable "hcp_hvn_id" {
  type        = string
  description = "The ID of the HashiCorp Virtual Network (HVN)."
}

variable "hcp_hvn_destination_cidr" {
  type        = string
  description = "The destination CIDR of the HVN route."
}

variable "hcp_hvn_target_link" {
  type        = string
  description = "A unique URL identifying the target of the HVN route. Examples of the target: aws_network_peering, aws_transit_gateway_attachment"
}

variable "create_timeout" {
  type        = string
  description = "HVN route create timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "3m"
}

variable "delete_timeout" {
  type        = string
  description = "HVN route delete timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "5m"
}
