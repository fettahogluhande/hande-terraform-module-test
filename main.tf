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
  visibility  = "public"

  has_issues = true
  has_wiki   = true

  topics = ["terraform", "module-test"]

  branches = [
  {
    name = "develop"
  }
]
  push_collaborators = [
    "sevdadurdu"
  ]
  branch_protections_v4 = [
  {
    pattern = "main"

    enforce_admins = true

    required_pull_request_reviews = {
      dismiss_stale_reviews           = true
      require_code_owner_reviews      = true
      #required_approving_review_count = 2
    }

    required_status_checks = {
      strict   = false
      contexts = []
    }
  }
]
  plaintext_secrets = {
  TEST_API_KEY = "123456"
}
}
