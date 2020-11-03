variable "username" {
  type    = string
  default = ""
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "gcp_primary_region" {
  default = ""
}

variable "gcp_ha_region" {
  default = ""
}

variable "gcp_account_name" {
  default = ""
}

variable "gcp_gw_size" {
  default = "n1-standard-1"
}

variable "gcp_sub1_cidr" {
  default = ""
}

variable "gcp_sub2_cidr" {
  default = ""
}

variable "gcp_spoke_region" {
  default = ""
}

variable "gcp_spoke_sub1_cidr" {
  default = ""
}

variable "aws_transit_cidr1" {
  default = ""
}

variable "aws_region1" {
  default = ""
}

variable "aws_transit_cidr2" {
  default = ""
}

variable "aws_region2" {
  default = ""
}
variable "aws_account_name" {
  default = ""
}

variable "azure_transit_cidr1" {
  default = ""
}

variable "azure_region1" {
  default = ""
}

variable "azure_account_name" {
  default = ""
}

variable "azure_gw_size" {
  default = ""
}

variable "aws_gw_size" {
  default = ""
}

variable "aws_hpe_gw_size" {
  default = ""
}

variable "aws_spoke_gw_name_1" {
  type    = string
  default = ""
}

variable "aws_spoke_vpc_cidr_1" {
  type    = string
  default = ""
}

variable "aws_spoke_gw_name_2" {
  type    = string
  default = ""
}

variable "aws_spoke_vpc_cidr_2" {
  type    = string
  default = ""
}

variable "aws_spoke_gw_name_3" {
  type    = string
  default = ""
}

variable "aws_spoke_vpc_cidr_3" {
  type    = string
  default = ""
}

variable "aws_spoke_gw_name_4" {
  type    = string
  default = ""
}

variable "aws_spoke_vpc_cidr_4" {
  type    = string
  default = ""
}

variable "aws_spoke_gw_name_5" {
  type    = string
  default = ""
}

variable "aws_spoke_vpc_cidr_5" {
  type    = string
  default = ""
}

variable "azure_spoke1_name" {
  type    = string
  default = ""
}

variable "azure_spoke1_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke1_region" {
  type    = string
  default = ""
}

variable "azure_spoke2_name" {
  type    = string
  default = ""
}

variable "azure_spoke2_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke2_region" {
  type    = string
  default = ""
}

variable "gcp_spoke1_region" {
  type    = string
  default = ""
}

variable "gcp_spoke1_sub1_cidr" {
  type    = string
  default = ""
}

variable "gcp_spoke2_region" {
  type    = string
  default = ""
}

variable "gcp_spoke2_sub1_cidr" {
  type    = string
  default = ""
}

variable "firewall_image" {
  type = string
  default = ""
}

variable "insane" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = true
}

