# Creating Route-Table for Public Subnet
resource "aws_route_table" "publicRoute" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.destination_cidr
    gateway_id = var.internetgateway
  }
  tags = {
    Name = var.public_route_table_name
  }
}
