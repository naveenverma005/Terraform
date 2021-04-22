output "vpcID" {
  value = aws_vpc.vpc.id
}

output "vpccidr" {
  description = "CIDR of the VPC"
  value       = aws_vpc.vpc.cidr_block
}
