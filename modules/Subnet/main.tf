
resource "aws_subnet" "subnets" {
  vpc_id                  = var.vpc_id_input
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.az
  map_public_ip_on_launch = var.public_ip

  tags = {
    Name = var.subnet_display_name
  }
}