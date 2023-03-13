variable "base_iam_role_id" {}
variable "kms_key_alias" {}

locals {
  vm_launcher_role = "arn:aws:iam::903941721927:role/vm-launcher-role"
}
