variable "external_id" {
  type        = string
  description = "(required) External id for assume role"
}

variable "role_name" {
  type        = string
  default     = "Cloudbase"
  description = "(optional) Role name to connect Cloudbase"
}

variable "cspm_policy_prefix" {
  type        = string
  default     = "CloudbaseCSPMPolicy_"
  description = "(optional) Policy name prefix to connect Cloudbase"
}

variable "allow_container_scan_permissions" {
  default     = false
  description = "(optional) allow actions needed to scan container images. e.g) ecr:BatchGetImage"
}

variable "allow_vm_scan_permissions" {
  default     = false
  description = "(optional) allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots"
}

variable "allow_function_scan_permissions" {
  default     = false
  description = "(optional) allow actions needed to scan lambda functions. e.g) lambda:GetFunction"
}

variable "allow_cloudtrail_read_permissions" {
  default     = false
  description = "(optional) allow managed Policy AWSCloudTrail_ReadOnlyAccess"
}
