#EC2 config for bastion host
resource "aws_instance" "bastion_host" {
  ami           = var.bastion_ami
  instance_type = var.bastion_instance
  tags = {
    "Name" = "${var.bastion_host_name}"
  }
}