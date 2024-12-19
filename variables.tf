# REGION
variable "aws_region" {
  description = "AWS region for the resources"
  type = string
}

############################################################################
# VPC
variable "prefix_vpc" {
  description = "vpc tags"
  type        = string
}

variable "vpc_cidr" {
  description = "vpc cidr for vpc"
  type        = string
}

############################################################################
# SUBNETs
variable "pub_sub_cidr" {
  description = "List of cidr for public subnet "
  type        = list(string)
}

variable "pvt_sub_cidr" {
  description = "List of cidr for private subnet"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability_zones"
  type        = list(string)
}

############################################################################
# IGW
variable "prefix_igw" {
  description = "Tag of igw"
  type        = string
}

############################################################################
# EIP
variable "prefix_eip" {
  description = "Tag name of EIP"
  type        = string
}

############################################################################
# NAT GATEWAY
variable "prefix_ngw" {
  description = "Tag name of NAT gateway"
  type        = string
}

variable "index" {
  description = "Index of the public subnet to use for the NAT Gateway"
  type        = number
}

############################################################################
# ROUTE TABLEs
variable "prefix_pubrt" {
  description = "Public Route table tags"
  type        = string
}

variable "prefix_pvtrt" {
  description = "Private Route table tags"
  type        = string
}

############################################################################
# SECURITY GROUP
variable "prefix_sg" {
  description = "Security group tags"
  type        = string
}

variable "ingress_port" {
  description = "Ingress port values"
  type        = list(number)
}

############################################################################
# KEY MATERIAL
variable "ec2_key_name" {
  description = "The name of key-pair to access the instance"
  type        = string
}

variable "ec2_publickey_path" {
  description = "Path to the local public key material file"
  type        = string
}

############################################################################
# EC2 INSTANCES
variable "ami_id" {
  description = "The ami id for ec2 instances"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "pub_instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "pvt_instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "ec2-pub_instance_type" {
  description = "EC2 instance type: public/private"
  type        = string
  validation {
    condition     = contains(["public", "private"], var.ec2-pub_instance_type)
    error_message = "Must be type either public or private only"
  }
}

variable "ec2-pub_subnet_index" {
  description = "Subnet index number"
  type        = number
}

variable "pub_ec2_name" {
  description = "Instance name"
  type        = string
}

variable "ec2-pvt_instance_type" {
  description = "EC2 instance type: public/private"
  type        = string
  validation {
    condition     = contains(["public", "private"], var.ec2-pvt_instance_type)
    error_message = "Must be type either public or private only"
  }
}

variable "ec2-pvt_subnet_index" {
  description = "Subnet index number"
  type        = number
}

variable "pvt_ec2_name" {
  description = "Instance name"
  type        = string
}