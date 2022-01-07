data "aws_vpc" "default" {
  default = true
}

module "hcp_hvn" {
  source = "ugns/hcp-hvn/aws"
  # version = "x.x.x"

  hvn_region = var.hvn_region

  context = module.label.this
}

module "hcp_hvn_pcx" {
  source = "ugns/hcp-hvn-peering-connection/aws"
  # version = "x.x.x"

  hcp_hvn_id  = module.hcp_hvn.hcp_hvn_id
  peer_vpc_id = data.aws_vpc.default.id

  context = module.label.this
}

module "example" {
  source = "../.."
  # source  = "ugns/hcp-hvn-route/aws"
  # version = "x.x.x"

  hcp_hvn_id               = module.hcp_hvn.hcp_hvn_id
  hcp_hvn_destination_cidr = data.aws_vpc.default.cidr_blook
  hcp_hvn_target_link      = module.hcp_hvn_pcx.hcp_hvn_target_link

  context = module.label.this
}
