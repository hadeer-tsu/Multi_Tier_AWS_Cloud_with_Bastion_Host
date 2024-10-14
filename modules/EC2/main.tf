resource "aws_instance" "bastion" {
  count = var.bastion_instance_count > 0 ? var.bastion_instance_count : 0

  ami                    = var.ami_id
  instance_type          = var.instance_type

  # Directly reference the public subnets output
  subnet_id              = element(var.subnet_ids, count.index)

  key_name               = var.key_name
  associate_public_ip_address = true

  security_groups        = [var.security_group_ids.bastion]

  tags = {
    Name = "${var.resource_name}-bastion-${count.index}"
  }
}

resource "aws_instance" "private" {
  count = var.private_instance_count > 0 ? var.private_instance_count : 0

  ami                    = var.ami_id
  instance_type          = var.instance_type

  # Directly reference the private subnets output
  subnet_id              = element(var.subnet_ids, count.index)

  key_name               = var.key_name
  associate_public_ip_address = false

  security_groups        = [var.security_group_ids.private]

  user_data              = var.user_data
  tags = {
    Name = "${var.resource_name}-private-${count.index}"
  }
}
