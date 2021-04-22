# Variables for Public Subnets
variable "vpc_id" {
  description = "Provide VPC ID where you want to your Subnet"
}

variable "mapPublicIP" {
  type    = bool
  default = true
}

variable "publicSubnetCIDR" {
  description = "The CIDR for PublicSubnet-1"
}

variable "publicSubnetName" {
  type        = string
  default     = "PublicSubnet"
  description = "Name of our Public Subnet"
}
