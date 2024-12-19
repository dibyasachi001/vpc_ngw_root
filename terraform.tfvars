# REGION
aws_region = "ap-southeast-2"

# VPC 
vpc_cidr   = "10.0.0.0/16"
prefix_vpc = "my_vpc"

# SUBNETs
pub_sub_cidr       = ["10.0.0.0/24", "10.0.1.0/24"]
pvt_sub_cidr       = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]

#IGW
prefix_igw = "my_vpc_igw"

# EIP
prefix_eip = "my_vpc_eip"

# NAT GATEWAY
prefix_ngw = "my_vpc_ngw"
index      = 0 # Index of the public subnet to use for setup the NAT Gateway

# ROUTE TABLEs
prefix_pubrt = "pub_RT"
prefix_pvtrt = "pvt_RT"

# SECURITY GROUPs
prefix_sg    = "myvpc_SG"
ingress_port = [22, 80, 443]

# EC2 KEY MATERIAL
ec2_key_name       = "linuxkey"
ec2_publickey_path = "/home/dibyasachir/.ssh/id_rsa.pub" # Adjust based on your local public key file path

# Public EC2 INSTANCEs
ami_id                = "ami-0146fc9ad419e2cfd"
instance_type         = "t2.micro"
ec2-pub_instance_type = "public" # Enter either "public" or "private"
ec2-pub_subnet_index  = 0        # Enter index number according to your subnet cidr list
pub_instance_count    = 1        # Enter the number intances to create 
pub_ec2_name          = "Pub_server1"

# Private EC2 INSTANCES
ec2-pvt_instance_type = "private" # Enter either "public" or "private"
ec2-pvt_subnet_index  = 0         # Enter index number according to your subnet cidr list  
pvt_instance_count    = 1         # Enter the number intances to create  
pvt_ec2_name          = "Pvt_server2"

