# Using Data Source for retrieving AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating Public Subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.publicSubnetCIDR
  map_public_ip_on_launch = var.mapPublicIP
  tags = {
    Name = var.publicSubnetName
  }
  availability_zone = data.aws_availability_zones.available.names[0]
}
