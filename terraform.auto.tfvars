// Modify values below as needed

# Access Account Names
aws_account_name   = "TM-AWS"
firewall_image     = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 2"
azure_account_name = "TM-Azure"

# Insane and HA flags
insane     = true
ha_enabled = true

# Gateway Sizes
aws_hpe_gw_size = "c5n.xlarge"
azure_gw_size   = "Standard_D2_v2"

# Transit Gateway Network Variables
//AWS
aws_transit_cidr1 = "10.18.0.0/16"
aws_region1       = "us-east-2"
aws_transit_cidr2 = "10.19.0.0/16"
aws_region2       = "us-west-2"

//Azure
azure_transit_cidr1 = "10.21.2.0/24"
azure_region1       = "East US"

# Transit Spoke Parameters
// AWS Spokes
aws_spoke_vpc_cidr_1 = "10.23.1.0/16"
aws_spoke_gw_name_1  = "shared-services"
aws_spoke_vpc_cidr_2 = "10.24.5.0/16"
aws_spoke_gw_name_2  = "app1-r1s1"
aws_spoke_vpc_cidr_3 = "10.25.4.0/16"
aws_spoke_gw_name_3  = "app2-r1s1"
aws_spoke_vpc_cidr_4 = "10.26.5.0/16"
aws_spoke_gw_name_4  = "app1-r2s1"
aws_spoke_vpc_cidr_5 = "10.27.6.0/16"
aws_spoke_gw_name_5  = "app2-r2s1"

// Azure Spokes
azure_spoke1_name   = "Azure-app1"
azure_spoke1_cidr   = "10.21.1.0/24"
azure_spoke1_region = "North Central US"
azure_spoke2_name   = "Azure-app2"
azure_spoke2_cidr   = "10.21.3.0/24"
azure_spoke2_region = "North Central US"