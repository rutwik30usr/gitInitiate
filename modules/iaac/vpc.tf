resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    
  }
}


resource "aws_subnet" "public01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public01"
  }
}

resource "aws_subnet" "privte" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "publicroute" {
  vpc_id = aws_vpc.main.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}



resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.publicroute.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.privte.id
  route_table_id = aws_route_table.private.id
}
