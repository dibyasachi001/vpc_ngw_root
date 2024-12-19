module "VPC" {
  # source = "./vpc_ngw/VPC"
  source   = "github.com/dibyasachi001/vpc_ngw/VPC"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.prefix_vpc

  # SUBNETs
  vpc_id             = module.VPC.vpc_id
  pub_sub_cidr       = var.pub_sub_cidr
  pvt_sub_cidr       = var.pvt_sub_cidr
  availability_zones = var.availability_zones

  # IGW
  igw_name = var.prefix_igw

  # EIP
  eip_name = var.prefix_eip

  # NGW
  index    = var.index
  ngw_name = var.prefix_ngw

  # ROUTE TABLEs
  public_subnet  = module.VPC.pub_sub_ids
  private_subnet = module.VPC.pvt_sub_ids
  subnetids      = module.VPC.pub_sub_ids
  pubrt_name     = var.prefix_pubrt
  pvtrt_name     = var.prefix_pvtrt

}


module "SECURITY_GROUP" {
  # source = "./vpc_ngw/SECURITY_GROUP"
  source   = "github.com/dibyasachi001/vpc_ngw/SECURITY_GROUP"
  vpc_id       = module.VPC.vpc_id
  sg_name      = var.prefix_sg
  ingress_port = var.ingress_port
}

module "KEY" {
  # source = "./vpc_ngw/KEY"
  source   = "github.com/dibyasachi001/vpc_ngw/KEY"
  ec2_key_name = var.ec2_key_name
  publickey    = file(var.ec2_publickey_path)
}

module "EC2_pub" {
  # source = "./vpc_ngw/INSTANCE"
  source   = "github.com/dibyasachi001/vpc_ngw/INSTANCE"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_count = var.pub_instance_count
  ec2_subnet_id  = var.ec2-pub_instance_type == "public" ? module.VPC.pub_sub_ids[var.ec2-pub_subnet_index] : module.VPC.pvt_sub_ids[var.ec2-pub_subnet_index]
  ec2_sg_id      = tolist([module.SECURITY_GROUP.sg_id])
  ec2_key_name   = var.ec2_key_name
  ec2_name       = var.pub_ec2_name


}

module "EC2_pvt" {
  # source = "./vpc_ngw/INSTANCE"
  source   = "github.com/dibyasachi001/vpc_ngw/INSTANCE"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_count = var.pvt_instance_count
  ec2_subnet_id  = var.ec2-pvt_instance_type == "public" ? module.VPC.pub_sub_ids[var.ec2-pvt_subnet_index] : module.VPC.pvt_sub_ids[var.ec2-pvt_subnet_index]
  ec2_sg_id      = tolist([module.SECURITY_GROUP.sg_id])
  ec2_key_name   = var.ec2_key_name
  ec2_name       = var.pvt_ec2_name
} 