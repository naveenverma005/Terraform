# Variables for VPC
variable "vpc_cidr" {
  type = string
  #default     = "10.0.0.0/16"
  description = "This is the CIDR Block for VPC"
}

variable "instanceTenancy" {
  type        = string
  default     = "default"
  description = "Taking Instance Tenancy"
}

variable "vpcName" {
  type        = string
  default     = "vpc-cFast"
  description = "This is your VPC name"
}
