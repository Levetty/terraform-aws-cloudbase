# terraform-aws-cloudbase

Terraform aws module for Cloudbase

## Usage

### Allow only CPSM read actions

```
module "cloudbase" {
  source  = "Levetty/cloudbase/aws"

  external_id        = "xxx" # required
  role_name          = "Cloudbase" # optional: default value is "Cloudbase"
  cspm_policy_prefix = "CloudbaseCSPMPolicy_" # optional: default value is "CloudbaseCSPMPolicy_"

  allow_container_scan_permissions  = false # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions         = false # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions   = false # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
  allow_cloudtrail_read_permissions = false # optional: if true, allow managed policy AWSCloudTrail_ReadOnlyAccess
}

output cloudbase_role_arn {
  value       = module.cloudbase.role_arn
  description = "For input Cloudbase console."
}
```

### Allow CPSM read actions and container scan actions

```
module "cloudbase" {
  source  = "Levetty/cloudbase/aws"

  external_id        = "xxx" # required
  role_name          = "Cloudbase" # optional: default value is "Cloudbase"
  cspm_policy_prefix = "CloudbaseCSPMPolicy_" # optional: default value is "CloudbaseCSPMPolicy_"

  allow_container_scan_permissions  = true  # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions         = false # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions   = false # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
  allow_cloudtrail_read_permissions = false # optional: if true, allow managed policy AWSCloudTrail_ReadOnlyAccess
}

output cloudbase_role_arn {
  value       = module.cloudbase.role_arn
  description = "For input Cloudbase console."
}
```

### Allow all scan actions

```
module "cloudbase" {
  source  = "Levetty/cloudbase/aws"

  external_id        = "xxx" # required
  role_name          = "Cloudbase" # optional: default value is "Cloudbase"
  cspm_policy_prefix = "CloudbaseCSPMPolicy_" # optional: default value is "CloudbaseCSPMPolicy_"

  allow_container_scan_permissions  = true # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions         = true # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions   = true # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
  allow_cloudtrail_read_permissions = true # optional: if true, allow managed policy AWSCloudTrail_ReadOnlyAccess
}

output cloudbase_role_arn {
  value       = module.cloudbase.role_arn
  description = "For input Cloudbase console."
}
```
