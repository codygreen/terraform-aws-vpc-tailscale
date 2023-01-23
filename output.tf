output "instance_ip_addr" {
  value = aws_instance.jumphost.private_ip
}

output "instance_name" {
  value = random_pet.server.id
}
