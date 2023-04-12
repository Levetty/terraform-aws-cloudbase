# terraform-aws-cloudbase

terraform aws module for cloudbase

## Usage

### Allow only CPSM read actions

```
module "cloudbase_role" {
  source  = "Levetty/cloudbase/aws"
  version = "0.4.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = false # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = false # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions  = false # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
}
```

### Allow CPSM read actions and container scan actions

```
module "cloudbase_role" {
  source  = "Levetty/cloudbase/aws"
  version = "0.4.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = true  # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = false # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions  = false # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
}
```

### Allow all scan actions

```
module "cloudbase_role" {
  source  = "Levetty/cloudbase/aws"
  version = "0.4.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = true # optional: if true, allow actions needed to scan container images. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = true # optional: if true, allow actions needed to scan virtual machines. e.g) ec2:CreateSnapshots
  allow_function_scan_permissions  = true # optional: if true, allow actions needed to scan lambda functions. e.g) lambda:GetFunction
}
```
