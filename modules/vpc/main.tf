
resource "aws_vpc" "mum_vpc" {

  cidr_block       = var.vpc_cidr_in
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_tag_in}-${var.vpc_tag}"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.mum_vpc.id
  cidr_block        = var.subnet_01_cidr_in
  availability_zone = var.az_zone_a

  tags = {
    Name = "${var.project_tag_in}-${var.subnet_01_tag}"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.mum_vpc.id
  cidr_block        = var.subnet_02_cidr_in
  availability_zone = var.az_zone_b

  tags = {
    Name = "${var.project_tag_in}-${var.subnet_02_tag}"
  }
}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.mum_vpc.id

  tags = {
    Name = "${var.project_tag_in}-${var.igw_tag}"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mum_vpc.id

  route {
    cidr_block = var.cidr_open
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_tag_in}-${var.public_routetable_tag}"
  }
}

resource "aws_route_table_association" "public_route_associate" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.mum_vpc.id


  tags = {
    Name = "${var.project_tag_in}-${var.private_routetable_tag}"
  }
}

resource "aws_route_table_association" "private_route_associate" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}