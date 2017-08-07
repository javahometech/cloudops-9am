
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

# Create public_subnet_1

resource "aws_subnet" "cloudops_public_subnet_1" {
  vpc_id     = "${aws_vpc.cloudops_vpc.id}"
  cidr_block = "172.31.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"
  tags {
    Name = "CloudOpsPublicSubnet"
  }
}
# Create public_subnet_2
resource "aws_subnet" "cloudops_public_subnet_2" {
  vpc_id     = "${aws_vpc.cloudops_vpc.id}"
  cidr_block = "172.31.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2b"
  tags {
    Name = "CloudOpsPublicSubnet"
  }
}

# Associate cloudops_public_subnet with cloudops_public_route_table

resource "aws_route_table_association" "cloudops_vpc_with_public_route_table_1" {
  subnet_id      = "${aws_subnet.cloudops_public_subnet_1.id}"
  route_table_id = "${aws_route_table.cloudops_public_route_table.id}"
}

resource "aws_route_table_association" "cloudops_vpc_with_public_route_table_2" {
  subnet_id      = "${aws_subnet.cloudops_public_subnet_2.id}"
  route_table_id = "${aws_route_table.cloudops_public_route_table.id}"
}


# Create private_subnet__1
resource "aws_subnet" "cloudops_private_subnet_1" {
  vpc_id     = "${aws_vpc.cloudops_vpc.id}"
  cidr_block = "172.31.3.0/24"
  availability_zone = "us-west-2c"
  tags {
    Name = "CloudOpsPrivateSubnet1"
  }
}

# Create a route table for private subnets

resource "aws_route_table" "private_sub_rt" {
      vpc_id = "${aws_vpc.cloudops_vpc.id}"
        route {
          cidr_block = "0.0.0.0/0"
          instance_id = "${aws_instance.nat_instance.id}"
        }
      tags {
        Name = "Private_Sub_RT"
      }
}

# Associate private subnets with its route table
resource "aws_route_table_association" "cloudops_vpc_with_private_route_table" {
  subnet_id      = "${aws_subnet.cloudops_private_subnet_1.id}"
  route_table_id = "${aws_route_table.private_sub_rt.id}"
}
