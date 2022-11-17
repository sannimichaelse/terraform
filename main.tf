provider "aws" {
  region = "us-east-1"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    vpc = "true"
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.dev-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    subnet = "true"
    Name = "dev-subnet-1"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.dev-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}