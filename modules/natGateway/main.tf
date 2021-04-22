# Creating NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = var.elasticIP
  subnet_id     = var.subnet_id
}
