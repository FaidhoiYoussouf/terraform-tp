terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

resource "random_string" "vpc_id" {
  length  = 8
  special = false
  upper   = false
}

resource "random_string" "instance_ip" {
  length  = 12
  special = false
  upper   = false
}

resource "random_string" "subnet_id" {
  length  = 6
  special = false
  upper   = false
}

output "vpc_id" {
  value = "vpc-${random_string.vpc_id.result}"
}

output "instance_ip" {
  value = "192.168.${random_string.instance_ip.result}"
}

output "subnet_id" {
  value = "subnet-${random_string.subnet_id.result}"
}