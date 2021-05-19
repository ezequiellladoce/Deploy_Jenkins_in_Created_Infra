/*
output "pb_ip" {
   value = module.ec2s.pub_ip
}
*/

output "snt_id" {
   value = module.subnets.snet_id
}

output "sgs_id" {
   value = module.sgs.sg_id
}

output "k_name" {
   value = module.ssh_keys.ssh_ec2_key
}
