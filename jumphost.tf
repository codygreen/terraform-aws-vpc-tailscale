resource "random_pet" "server" {
  length = 2
}
resource "aws_instance" "jumphost" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.egress.id]
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false
  key_name                    = var.key_name
  #   iam_instance_profile        = aws_iam_instance_profile.nms_profile.name

  user_data = templatefile("${path.module}/user_data/jumphost.tpl", {
    hostname           = random_pet.server.id
    tailscale_auth_key = var.tailscale_auth_key
  })

  tags = {
    Name    = format("%s-jumphost-%s", local.owner_name_safe, random_pet.server.id)
    Owner   = var.owner_email
    Project = format("%s-jumphost-on-xc", local.owner_name_safe)
  }
}
