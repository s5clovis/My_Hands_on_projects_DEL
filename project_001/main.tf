provider "aws" {
  region = "us-east-2"
}

# Terraform configuration
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_instance" "Jenkins_Server" {
  ami           = "ami-00eb69d236edcfaf8"
  instance_type = "t2.micro"

  tags = {
    Name        = "Dev_instance"
    Environment = "Development"
    Project     = "Project_001"
    Owner       = "s5clovis"
  }
}

output "instance_id" {
  value = aws_instance.Jenkins_Server.id
}
