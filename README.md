# terraform-aws-cloudbase

terraform aws module for cloudbase

## Usage

### Allow only CPSM read actions

```
module "cloudbase_role_read_only" {
  source  = "Levetty/cloudbase/aws"
  version = "0.3.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = false # optional: if true, allow actions needed to scan container image. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = false # optional: if true, allow actions needed to scan container image. e.g) ec2:CreateSnapshots
}
```

### Allow CPSM read actions and container scan actions

```
module "cloudbase_role_read_only" {
  source  = "Levetty/cloudbase/aws"
  version = "0.3.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = true  # optional: if true, allow actions needed to scan container image. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = false # optional: if true, allow actions needed to scan container image. e.g) ec2:CreateSnapshots
}
```

### Allow all scan actions

```
module "cloudbase_role_read_only" {
  source  = "Levetty/cloudbase/aws"
  version = "0.3.0"

  external_id = "xxx" # required
  role_name   = "Cloudbase" # optional: default value is "Cloudbase"

  allow_container_scan_permissions = true # optional: if true, allow actions needed to scan container image. e.g) ecr:BatchGetImage
  allow_vm_scan_permissions        = true # optional: if true, allow actions needed to scan container image. e.g) ec2:CreateSnapshots
}
```
