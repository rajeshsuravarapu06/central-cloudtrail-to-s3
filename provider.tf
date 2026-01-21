provider "aws" {
  assume_role {
    # The role ARN within Account B to AssumeRole into. Created in step 1.
    role_arn = "arn:aws:iam::${var.account}:role/${var.account_role}"
  }
  region = var.region
}
provider "aws" {
  assume_role {
    # The role ARN within Account B to AssumeRole into. Created in step 1.
    role_arn = "arn:aws:iam::${var.account}:role/${var.account_role}"
  }
  alias  = "region-2"
  region = var.region_2
}

provider "aws" {
  assume_role {
    # The role ARN within Account B to AssumeRole into. Created in step 1.
    role_arn = "arn:aws:iam::${var.account}:role/${var.account_role}"
  }
  alias  = "region-1"
  region = var.region_1

}
terraform {
  cloud {
    organization = "applhome"

    workspaces {
      name = "aws-cloudtrail-central-logging-account"
    }
  }
}
