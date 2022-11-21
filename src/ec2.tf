# api Host AMI
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  owners = ["099720109477"] # ubuntu
}

# api host EC2 instance
resource "aws_instance" "api_host" {
  ami           = "${data.aws_ami.ubuntu_ami.id}"
  instance_type = "t2.micro"
  key_name      = var.key_name

  vpc_security_group_ids = ["${aws_security_group.api_host.id}"]
  subnet_id              = "${element(aws_subnet.private_subnet.*.id, 1)}"
  associate_public_ip_address = true

  tags = {
    Name = "JumiaAPIec2"
  }
}