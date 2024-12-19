############################################################################
# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.VPC.vpc_id
}

############################################################################
# SUBNETs
output "pub_sub_ids" {
  description = "The IDs of public subnets"
  value       = module.VPC.pub_sub_ids
}

output "pvt_sub_ids" {
  description = "The IDs of private subnets"
  value       = module.VPC.pvt_sub_ids
}

############################################################################
# IGW
output "aws_internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = module.VPC.aws_internet_gateway_id
}

############################################################################
# EIP
output "eip_allocation_id" {
  description = "The allocation ID of the Elastic IP."
  value       = module.VPC.allocation_id
}

output "public_ip" {
  description = "The public IP address of the Elastic IP."
  value       = module.VPC.public_ip
}

############################################################################
# NAT GATEWAY
output "natgateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.VPC.natgateway_id
}

############################################################################
# PUBLIC ROUTE TABLE IDs
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.VPC.pubrt_id
}

#Private Route Table IDs
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.VPC.pvtrt_id
}

############################################################################
# SECURITY GROUP
output "sg_id" {
  description = "The ID of security group"
  value       = module.SECURITY_GROUP.sg_id
}

############################################################################
# KEY MATERIAL
output "key_pair_id" {
  description = "The ID of the created key pair"
  value       = module.KEY.key_pair_id
}

############################################################################
# EC2 INSTANCES
# output "instance_id" {
#   description = "The ID of the instances"
#   value       = module.EC2_pub.instance_id

# }

output "instance_pubip" {
  description = "Public ip of instances"
  # value       = module.INSTANCE.instance_pubip
  value = module.EC2_pub.instance_pubip
}

output "instance_pvtip" {
  description = "Private ip of instances"
  # value       = module.INSTANCE.instance_pvtip
  value = module.EC2_pvt.instance_pubip
}  