  
# Keypair
resource "aws_key_pair" "api_host_key" {
  key_name   = "api_host_key"
  public_key = "${file(var.api_host_public_key)}"
}

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

# api Host Security Group
resource "aws_security_group" "api_host" {
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    
    // IP address, or CIDR block
    cidr_blocks = ["10.0.0.0/16"]
  }

}

# api host EC2 instance
resource "aws_instance" "api_host" {
  ami           = "${data.aws_ami.ubuntu_ami.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.api_host_key.key_name}"

  vpc_security_group_ids = ["${aws_security_group.api_host.id}"]
  subnet_id              = "${element(aws_subnet.private_subnet.*.id, 1)}"
  associate_public_ip_address = true
}