resource "aws_subnet" "subnet" {
      vpc_id = var.vvpc_id
      cidr_block = var.sbnet_cir_block
}
