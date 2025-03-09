/* Terraform Block
   contains settings including the provider(s) to provision */

terraform {
  required_providers {
    aws = {
      # short for registry.terraform.io/hashicorp/aws
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


/* Provider Block
   declare the specified provider and other settings */

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


/* Resource Block
   The resources to build (EC2, S3 bucket, etc.)       
resource <resource type> <resource name>  */

resource "aws_instance" "app_server" {
  # ami points to an ubuntu image (these are unique per region)
  ami           = "ami-08b5b3a93ed654d19"
  # size of the machine is t2.micro
  instance_type = "t2.micro"
  # tag is metadata information
  tags = {
    Name = "AltaResearchRZF"
  }
}

import {
  id = "i-07ec12e3171eb0e21"  # THIS NEEDS TO BE UPDATED TO MATCH YOUR INSTANCE ID
  to = aws_instance.app_server
}

