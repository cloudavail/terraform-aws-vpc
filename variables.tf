variable "availability_zones" {
  type        = list(string)
  description = "list of Availability Zones where subnets can be created."
}

variable "nat_subnet_cidr_blocks" {
  type        = list(string)
  description = "list of NAT Subnet CIDR Blocks."
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "list of Private Subnet CIDR Blocks."
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "list of Public Subnet CIDR Blocks."
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block."
}

variable "vpc_flow_log_retention_in_days" {
  type        = number
  default     = 30
  description = "Number of days VPC Flow Logs should be Retained."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC. Will be used as a prefix for all VPC resources."
}
