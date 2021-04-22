# Creating Route-Table Association for Public Subnets
resource "aws_route_table_association" "publicAssociation" {
  route_table_id    = var.public_route_table
  subnet_id         = var.subnet_id
}
