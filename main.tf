terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.0"
    }
  }
  cloud {

    organization = "testmagsyg2"

    workspaces {
      name = "workspace"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}