output  "ssh_ec2_key" {
  value = aws_key_pair.generated_key.key_name
}
