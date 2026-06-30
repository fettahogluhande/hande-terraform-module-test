terraform {
  required_version = ">= 1.8.5"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.11.1"
    }
  }
}

provider "github" {}

module "test_repo" {
  source = "git::ssh://git@github.com/migroscomtr/terraform-modules.git//github/modules/repository?ref=master"

  name        = "hande-terraform-module-test"
  description = "Testing repository module with Terraform"
  visibility  = "private"

  has_issues = false
  has_wiki   = true

  topics = ["terraform", "module-test"]

  branches = [
  {
    name = "develop"
  }
]
}
