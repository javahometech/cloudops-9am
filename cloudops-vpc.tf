resource "aws_vpc" "cloudops_vpc" {
  cidr_block = "172.31.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "CloudOpsVpc"
    Environment = "Dev"
  }
}
