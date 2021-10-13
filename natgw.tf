resource "aws_nat_gateway" "nat_gw1" {
  # The Allocation ID fro the EIP address for the gateway
  allocation_id = aws_eip.nat1.id
  # Subnet ID of the subnet in which to place the gateway
  subnet_id = aws_subnet.public_1.id

  tags = {
    Name = "gw NAT1"
  }
}
resource "aws_nat_gateway" "nat_gw2" {
  # The Allocation ID fro the EIP address for the gateway
  allocation_id = aws_eip.nat2.id
  # Subnet ID of the subnet in which to place the gateway
  subnet_id = aws_subnet.public_2.id

  tags = {
    Name = "gw NAT2"
  }
}