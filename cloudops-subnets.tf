
# Route table for public_subnet

resource "aws_route_table" "cloudops_public_route_table" {
  vpc_id = "${aws_vpc.cloudops_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.cloudops_igw.id}"
  }

  tags {
    Name = "PublicSubnetRouteTable"
  }
}

# Create public_subnet

resource "aws_subnet" "cloudops_public_subnet" {
  vpc_id     = "${aws_vpc.cloudops_vpc.id}"
  cidr_block = "172.31.1.0/24"
  availability_zone = "us-west-2a"
  tags {
    Name = "CloudOpsPublicSubnet"
  }
}

# Associate cloudops_public_subnet with cloudops_public_route_table

resource "aws_route_table_association" "cloudops_vpc_with_public_route_table" {
  subnet_id      = "${aws_subnet.cloudops_public_subnet.id}"
  route_table_id = "${aws_route_table.cloudops_public_route_table.id}"
}
