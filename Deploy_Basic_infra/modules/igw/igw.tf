resource "aws_internet_gateway" "igw" {
  vpc_id = var.sg_vpc_id
}

resource "aws_route_table" "rtb_public" {
  vpc_id = var.sg_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.subnet.id
}
