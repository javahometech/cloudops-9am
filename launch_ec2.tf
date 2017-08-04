resource "aws_instance" "demo-ec2" {
    ami = "${var.AMI_ID}"
    instance_type = "${var.AWS_INSTANCE_TYPE}"
    tags {
      Name = "TerraformDemo"
    }
}
