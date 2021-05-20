provider "aws" {
  region = "us-east-2"
}

data "terraform_remote_state" "if_trs" {
  backend = "s3"
  config = {
      bucket = "backendbucket20210519"
      key    = "data_front/"
      region = "us-east-2"
  }
}

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
   subnet_id                   = data.terraform_remote_state.if_trs.outputs.snt_id
   vpc_security_group_ids      = [data.terraform_remote_state.if_trs.outputs.sgs_id]
   key_name                    = data.terraform_remote_state.if_trs.outputs.k_name
   tags = {
         Name = "EC2_Jenkins_Instance"
   }
}

terraform {
  backend "s3" {
    bucket = "backendbucket20210519"
    key    = "data_front_2/"
    region = "us-east-2"
  }
}
