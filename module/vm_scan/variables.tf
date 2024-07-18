variable "base_iam_role_id" {
  description = "The Name of Cloudbase IAM role for attaching policies"
  type        = string
}

variable "kms_key_alias" {
  description = "The KMS key alias to use for the Cloudbase IAM Role"
  type        = string
}
