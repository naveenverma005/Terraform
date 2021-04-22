# Variables for VPC
variable "VPCCIDR" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instanceTenancy" {
  type    = string
  default = "default"
}

variable "vpcName" {
  type    = string
  default = "Pratap"
}

# Variables for IGW
variable "igwName" {
  type        = string
  default     = "cFast-IGW"
  description = "Name of Internet Gateway"
}

# Variables for Public Subnet
variable "publicSubnetCIDR" {
  type        = string
  default     = "10.0.0.0/28"
  description = "The CIDR for PublicSubnet"
}

variable "mapPublicIP" {
  type    = bool
  default = true
}

variable "publicSubnetName" {
  type        = string
  default     = "PublicSubnet"
  description = "Name of our Public Subnet"
}

# Variables for NAT
variable "eip" {
  type    = string
  default = "eipalloc-02261171506c49aa9"
}
