/* main.tf
   Deploy a small ec2 instance on AWS */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           ="ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

