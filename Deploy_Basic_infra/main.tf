provider "aws" {
   region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "backendbucket20210505"
    key    = "data_front/"
    region = "us-east-2"
  }
}

module "ec2s" {
  source = "./modules/ec2"
  sn_id = module.subnets.snet_id
  sec_group = module.sgs.sg_id
  priv_key_nane = module.ssh_keys.ssh_ec2_key
#  ec2_key_name = module.ssh_keys.ssh_ec2_key
#  p_ip = module.ec2s.pub_ip
}

module "vpcs" {
  source = "./modules/vpc"
}

module "subnets" {
  source ="./modules/subnet"
  vvpc_id = module.vpcs.vpc_id
}

module "sgs" {
  source = "./modules/sg"
  sg_vpc_id = module.vpcs.vpc_id
}

module "ssh_keys" {
  source = "./modules/ssh_key"
}

module "igws" {
  source = "./modules/igw"
  snet_id = module.subnets.snet_id
  sg_vpc_id = module.vpcs.vpc_id
}
