resource "tls_private_key" "priv_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.priv_key.public_key_openssh
}

resource "aws_secretsmanager_secret" "ec2-secret-key-c" {
  name = var.Secret_Key
  description = "Name of the secret key"
  tags = {
    Name = "EC2-Secret-Key"
  }
}

resource "aws_secretsmanager_secret_version" "secret_priv" {
  secret_id     = aws_secretsmanager_secret.ec2-secret-key-c.id
  secret_string = tls_private_key.priv_key.private_key_pem
}
