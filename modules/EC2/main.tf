resource "aws_instance" "bastion" {
  count = var.bastion_instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index]
  key_name               = var.key_name
  associate_public_ip_address = var.subnet_configs[count.index].assign_public_ip

  security_groups = [var.security_group_ids.bastion]

  tags = {
    Name = "${var.resource_name}-bastion-${count.index}"
  }
}

resource "aws_instance" "private" {
  count = var.private_instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index]
  key_name               = var.key_name
  associate_public_ip_address = var.subnet_configs[count.index].assign_public_ip

  security_groups = [var.security_group_ids.private]

  user_data = var.user_data
  tags = {
    Name = "${var.resource_name}-private-${count.index}"
  }
}
