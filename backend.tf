terraform {
  backend "s3" {
    bucket = "coinsfast"
    key = "coinsfast/terraform.tfstate"
    region = "us-east-1"
  }
}
