provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
}
resource "aws_instance" "demo-ec2" {
    ami = "${var.AMI_ID}"
    instance_type = "${var.AWS_INSTANCE_TYPE}"
    tags {
      Name = "TerraformDemo"
    }
}

terraform {
  backend "s3" {
    bucket = "cloudops-terraform-state-prod"
    key    = "cloudops"
    region = "us-west-2"
  }
}

# data "terraform_remote_state" "network" {
#   backend = "s3"
#   config {
#     bucket = "cloudops-terraform-state-prod"
#     key    = "terraform.tfstate"
#
#     access_key = "${var.AWS_ACCESS_KEY}"
#     secret_key = "${var.AWS_SECRET_KEY}"
#   }
# }
