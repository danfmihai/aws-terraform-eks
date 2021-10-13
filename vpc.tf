resource "aws_vpc" "eks" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eks"
  }
}