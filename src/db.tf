resource "aws_db_instance" "jumiadb" {
  allocated_storage = 50
  identifier = "jumiadb"
  storage_type = "gp2"
  engine = "postgres"
  instance_class = "db.t4g.micro"
  engine_version = "14"
  name = "jumia_phone_validator"
  username = "jumia"
  password = "jumia54132"
  vpc_security_group_ids = [aws_security_group.jumiadbsg.id]
  db_subnet_group_name = "${aws_db_subnet_group.db-subnet.name}"
}

resource "aws_security_group" "jumiadbsg" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "jumiadbsg"
  description = "Allow all inbound for Postgres"
ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "db-subnet" {
  name = "dbsubnetgroup"
  subnet_ids = "${aws_subnet.private_subnet.*.id}"
}