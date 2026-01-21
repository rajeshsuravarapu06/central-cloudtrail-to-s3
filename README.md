Below is a **clean, professional README.md** based on a full analysis of your Terraform and GitHub Actions code.
You can copy-paste this directly into your repository.

---

# Centralized CloudTrail Logging – Terraform

## Overview

This repository provisions **centralized, secure Amazon S3 buckets** for **AWS CloudTrail log ingestion and cross-account replication** across **two AWS regions** using **Terraform Cloud** and **GitHub Actions**.

The solution enforces **security best practices** such as:

* Cross-account access control
* Object Lock (Compliance mode)
* Lifecycle management
* Public access blocking
* Centralized IAM-based replication permissions

---

## Architecture Summary

* **Two S3 buckets** created in different AWS regions:

  * Primary region (`region_1`, default: `us-east-1`)
  * Secondary region (`region_2`, default: `us-west-2`)
* Buckets are used for **CloudTrail centralized logging**
* **Cross-account replication roles** from multiple AWS accounts are allowed
* **Terraform Cloud** is used for state management
* **GitHub Actions** is used to deploy changes securely using Vault

---

## Key Features

### 1. S3 Buckets

* Unique bucket names generated using `random_id`
* Versioning enabled
* Object Lock enabled in **COMPLIANCE mode (60 days)**
* Tagged for ownership and application identification

### 2. IAM Bucket Policies

Each bucket policy allows:

* Cross-account CloudTrail replication roles to:

  * List buckets
  * Replicate objects
  * Manage versioning
* Root accounts from multiple AWS accounts to:

  * Override object ownership (`s3:ObjectOwnerOverrideToBucketOwner`)
* Cortex XDR user to:

  * Read objects (`s3:GetObject`)

Policies are defined using `aws_iam_policy_document` data sources for clarity and reuse.

---

## Lifecycle Management

Each bucket has lifecycle rules configured:

| Action                    | Days |
| ------------------------- | ---- |
| Transition to STANDARD_IA | 100  |
| Transition to ONEZONE_IA  | 270  |
| Transition to GLACIER     | 730  |
| Expiration                | 1100 |

This ensures **cost optimization** while maintaining long-term audit retention.

---

## Security Controls

* **Block Public Access** enabled on all buckets
* **Object Lock (Compliance Mode)** prevents deletion or modification
* Cross-account access strictly controlled via IAM roles
* No public ACLs or public bucket policies allowed

---

## Providers & Authentication

### AWS Provider

* Uses **cross-account role assumption**
* Same role used across multiple regions
* Region-specific providers configured using aliases

### Terraform Cloud

* Backend configured using Terraform Cloud
* Workspace: `aws-cloudtrail-central-logging-account`
* Organization: `applhome`

---

## Variables

| Variable       | Description            | Default     |
| -------------- | ---------------------- | ----------- |
| `account`      | Target AWS Account ID  | Required    |
| `account_role` | Cross-account IAM role | Required    |
| `region`       | Default AWS region     | Required    |
| `region_1`     | Primary S3 region      | `us-east-1` |
| `region_2`     | Secondary S3 region    | `us-west-2` |

---

## GitHub Actions Workflow

### Workflow Name

**Central Logging Bucket Policy Update**

### Trigger

* Manual trigger (`workflow_dispatch`)

### What It Does

1. Checks out code
2. Retrieves AWS credentials from **Vault**
3. Retrieves Terraform Cloud token
4. Injects AWS credentials into Terraform Cloud workspace
5. Runs:

   * `terraform fmt`
   * `terraform init`
   * `terraform apply`

### Security Highlights

* Uses **OIDC / JWT authentication**
* No hardcoded credentials
* Secrets managed via **HashiCorp Vault**

---

## Files Breakdown

| File               | Purpose                                          |
| ------------------ | ------------------------------------------------ |
| `data.tf`          | IAM bucket policies for both regions             |
| `provider.tf`      | AWS & Terraform Cloud provider configuration     |
| `variables.tf`     | Input variables                                  |
| `terraform.tfvars` | Environment-specific values                      |
| `s3-logging.tf`    | S3 bucket, lifecycle, object lock, access blocks |
| `action.yaml`      | GitHub Actions CI/CD workflow                    |

---

## Prerequisites

* Terraform Cloud access
* HashiCorp Vault configured
* AWS Organization with:

  * CloudTrail replication roles
  * OrganizationAccountAccessRole
* GitHub repository with workflow permissions enabled

---

## Deployment

1. Update `terraform.tfvars` if needed
2. Trigger GitHub Actions workflow manually
3. Review Terraform plan
4. Apply changes

---

## Notes

* Bucket names include a random suffix to avoid conflicts
* Object Lock **cannot be disabled once enabled**
* Ensure all listed AWS accounts maintain required replication roles

---

## Owner

**AWS Security / Central Logging Team**
Application ID: `AWSSECHS`

---

If you want, I can also:

* Add **architecture diagrams**
* Optimize IAM policy size
* Convert this into a **Terraform module README**
* Review for **AWS Security Hub / CIS compliance**

Just tell me 👍
