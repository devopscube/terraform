#This is terraform configuration file for creating VPC resources

provider "aws" {
  region     = "us-west-2"
}

resource "aws_vpc" "development" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags {
        Name        = "DEVOPSCUBE-TEST-VPC"
        Environment = "DEVELOPMENT"
    }
}

resource "aws_internet_gateway" "development" {
    vpc_id = "${aws_vpc.development.id}"
    tags {
        Name        = "dev-internet-gateway"
        Environment = "development"
    }
}
