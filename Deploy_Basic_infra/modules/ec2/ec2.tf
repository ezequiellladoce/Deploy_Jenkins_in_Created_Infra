data "aws_ami" "lubuntu" {
 most_recent     = true
 owners = ["099720109477"]

 filter {
   name   = "name"
   values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
 }
 filter {
   name   = "virtualization-type"
   values = ["hvm"]
 }
}

resource "aws_instance" "ec2" {
   ami           = data.aws_ami.lubuntu.id
   instance_type = var.inst_type
   associate_public_ip_address = true
   subnet_id                   = var.sn_id
   vpc_security_group_ids      = [var.sec_group]
   key_name = var.ec2_key_name
   tags = {
         Name = "EC2_Instance"
   }
}
