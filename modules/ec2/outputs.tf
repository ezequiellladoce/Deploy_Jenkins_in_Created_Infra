output "instance_id" {
  value = aws_instance.ec2.id
}

output "pub_ip" {
  value = aws_instance.ec2.public_ip
}
