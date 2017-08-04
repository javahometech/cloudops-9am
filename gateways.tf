resource "aws_internet_gateway" "cloudops_igw" {
  vpc_id = "${aws_vpc.cloudops_vpc.id}"
  tags {
    Name = "CloudopsIGW"
  }
}
