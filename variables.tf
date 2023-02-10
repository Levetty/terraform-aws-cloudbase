variable "external_id" {
  type        = string
  description = "(required) External id for assume role"
}

variable "role_name" {
  type        = string
  default     = "Cloudbase"
  description = "(optional) Role name to connect Cloudbase"
}

variable "allow_container_scan_permissions" {
  default     = false
  description = "(optional) allow actions needed to scan container image. e.g) ecr:BatchGetImage"
}

variable "allow_vm_scan_permissions" {
  default     = false
  description = "(optional) allow actions needed to scan container image. e.g) ec2:CreateSnapshots"
}
