provider "aws" {
  region = "us-east-1"
  profile = "default"
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

