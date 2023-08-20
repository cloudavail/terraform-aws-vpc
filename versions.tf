terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # note that we explicitly require aws provider version 4.2.0
      # in order to support the aws_eip "domain" argument
      version = ">= 5"
    }
  }
  required_version = ">= 1"
}
