terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      # Be sure this matches the version in the administration repo.
      version = "~> 0.24.0"
    }
    local      = ">= 1.4"
    null       = ">= 2.1"
    template   = ">= 2.1"
    random     = ">= 2.1"
    kubernetes = ">= 1.11.1"
  }
}


resource "null_resource" "example5" {}

resource "null_resource" "example2" {}
