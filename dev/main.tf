module "vpc" {
  source          = "../modules/vpc"
  vpc_cidr        = var.VPCCIDR
  instanceTenancy = var.instanceTenancy
  vpcName         = var.vpcName
}

module "igw" {
  source              = "../modules/igw"
  vpc_id              = module.vpc.vpcID
  internetGateWayName = var.igwName
}

module "publicSubnet" {
  source           = "../modules/publicSubnet"
  vpc_id           = module.vpc.vpcID
  publicSubnetCIDR = var.publicSubnetCIDR
  mapPublicIP      = var.mapPublicIP
  publicSubnetName = var.publicSubnetName
}

module "nat" {
  source    = "../modules/natGateway"
  elasticIP = var.eip
  subnet_id = module.publicSubnet.publicsubnetID
}

module "publicRouteTable" {
  source                  = "../modules/publicRouteTable"
  vpc_id                  = module.vpc.vpcID
  destination_cidr        = var.destination_cidr
  internetgateway         = module.igw.igwID
  public_route_table_name = var.public_route_table_name
}

module "publicRouteTableAssociation" {
  source = "../modules/routeTableAssociation"
  public_route_table = module.publicRouteTable.publicrouteID
  subnet_id          = module.publicSubnet.publicsubnetID
}
