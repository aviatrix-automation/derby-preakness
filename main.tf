// Derby
# AWS Transit Module Region 1
module "aws_transit_1" {
  source         = "terraform-aviatrix-modules/aws-transit-firenet/aviatrix"
  version        = "1.1.1"
  cidr           = var.aws_transit_cidr1
  region         = var.aws_region1
  account        = var.aws_account_name
  insane_mode    = var.insane
  instance_size  = var.aws_hpe_gw_size
  firewall_image = var.firewall_image
}

# AWS Transit Module Region 2
module "aws_transit_2" {
  source         = "terraform-aviatrix-modules/aws-transit-firenet/aviatrix"
  version        = "1.1.1"
  cidr           = var.aws_transit_cidr2
  region         = var.aws_region2
  account        = var.aws_account_name
  insane_mode    = var.insane
  instance_size  = var.aws_hpe_gw_size
  firewall_image = var.firewall_image
}

# AWS Spoke 1 Region 1
module "aws_spoke1" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.1"
  name          = var.aws_spoke_gw_name_1
  cidr          = var.aws_spoke_vpc_cidr_1
  region        = var.aws_region1
  account       = var.aws_account_name
  insane_mode   = var.insane
  instance_size = var.aws_hpe_gw_size
  ha_gw         = var.ha_enabled
  transit_gw    = module.aws_transit_1.transit_gateway.gw_name
}

# AWS Spoke 2 Region 1
module "aws_spoke2" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.1"
  name          = var.aws_spoke_gw_name_2
  cidr          = var.aws_spoke_vpc_cidr_2
  region        = var.aws_region1
  account       = var.aws_account_name
  insane_mode   = var.insane
  instance_size = var.aws_hpe_gw_size
  ha_gw         = var.ha_enabled
  transit_gw    = module.aws_transit_1.transit_gateway.gw_name
}

# AWS Spoke 3 Region 1
module "aws_spoke3" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.1"
  name          = var.aws_spoke_gw_name_3
  cidr          = var.aws_spoke_vpc_cidr_3
  region        = var.aws_region1
  account       = var.aws_account_name
  insane_mode   = var.insane
  instance_size = var.aws_hpe_gw_size
  ha_gw         = var.ha_enabled
  transit_gw    = module.aws_transit_1.transit_gateway.gw_name
}

# AWS Spoke 4 Region 2
module "aws_spoke4" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.1"
  name          = var.aws_spoke_gw_name_4
  cidr          = var.aws_spoke_vpc_cidr_4
  region        = var.aws_region2
  account       = var.aws_account_name
  insane_mode   = var.insane
  instance_size = var.aws_hpe_gw_size
  ha_gw         = var.ha_enabled
  transit_gw    = module.aws_transit_2.transit_gateway.gw_name
}

# AWS Spoke 5 Region 2
module "aws_spoke5" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.1"
  name          = var.aws_spoke_gw_name_5
  cidr          = var.aws_spoke_vpc_cidr_5
  region        = var.aws_region2
  account       = var.aws_account_name
  insane_mode   = var.insane
  instance_size = var.aws_hpe_gw_size
  ha_gw         = var.ha_enabled
  transit_gw    = module.aws_transit_2.transit_gateway.gw_name
}

# Azure Transit Module
module "azure_transit_1" {
  source                 = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version                = "1.0.2"
  ha_gw                  = true
  cidr                   = var.azure_transit_cidr1
  region                 = var.azure_region1
  account_name           = var.azure_account_name
  firewall_image         = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
  firewall_image_version = "9.1.0"
}

# Azure Spoke 1 
module "azure_spoke1" {
  source     = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version    = "1.0.1"
  name       = var.azure_spoke1_name
  cidr       = var.azure_spoke1_cidr
  region     = var.azure_spoke1_region
  account    = var.azure_account_name
  ha_gw      = var.ha_enabled
  transit_gw = module.azure_transit_1.transit_gateway.gw_name
}

# Azure Spoke 2
module "azure_spoke2" {
  source     = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version    = "1.0.1"
  name       = var.azure_spoke2_name
  cidr       = var.azure_spoke2_cidr
  region     = var.azure_spoke2_region
  account    = var.azure_account_name
  ha_gw      = var.ha_enabled
  transit_gw = module.azure_transit_1.transit_gateway.gw_name
}

# Multi region AWS and Single region Azure transit peering
module "transit-peering" {
  source           = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
  version          = "1.0.0"
  transit_gateways = [module.aws_transit_1.transit_gateway.gw_name, module.aws_transit_2.transit_gateway.gw_name, module.azure_transit_1.transit_gateway.gw_name]
}