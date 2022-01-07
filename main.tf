module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["route"]
  context    = module.this.context
}

data "hcp_hvn" "this" {
  count = local.enabled ? 1 : 0

  hvn_id = var.hcp_hvn_id
}

resource "hcp_hvn_route" "this" {
  count = local.enabled ? 1 : 0

  hvn_link         = data.hcp_hvn.this[0].self_link
  hvn_route_id     = module.label.id
  destination_cidr = var.hcp_hvn_destination_cidr
  target_link      = var.hcp_hvn_target_link

  timeouts {
    create = var.create_timeout
    delete = var.delete_timeout
  }
}

locals {
  enabled = module.this.enabled
}
