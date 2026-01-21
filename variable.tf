variable "account" {
  description = "Account in which the VPC needs to be created"
  type        = string
}

variable "role" {
  description = "AWS Role to assume for cross acoount"
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "account_role" {
  description = "Account Cross Account Role"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "region_1" {
  description = "S3 first Region"
  type        = string
  default     = "us-east-1"
}

variable "region_2" {
  description = "S3 second Region"
  type        = string
  default     = "us-west-2"
}

