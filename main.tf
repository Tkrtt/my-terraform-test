resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_all" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = var.ingress_ssh_from_port
    to_port     = var.ingress_ssh_to_port
    protocol    = var.ingress_ssh_protocol
    cidr_blocks = var.ingress_ssh_cidr_blocks
  }

  ingress {
    from_port   = var.ingress_http_from_port
    to_port     = var.ingress_http_to_port
    protocol    = var.ingress_http_protocol
    cidr_blocks = var.ingress_http_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }
}

data "template_file" "userdata" {
  template = file("userdata.tpl")
}

resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.subnet.id
  security_groups = [aws_security_group.allow_all.name]
  key_name        = var.key_name

  user_data = data.template_file.userdata.rendered

  tags = {
    Name = var.instance_name
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = data.vault_kv_secret_v2.db_credentials.data["db_username"]
  password             = data.vault_kv_secret_v2.db_credentials.data["db_password"]
  parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot  = var.db_skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.subnet.id]

  tags = {
    Name = var.db_subnet_group_tag
  }
}
