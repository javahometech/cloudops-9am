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
