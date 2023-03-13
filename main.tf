locals {
  cloudbase_role_arn = "arn:aws:iam::353293467505:role/cloudbase"
}

resource "aws_iam_role" "cloudbase_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          AWS = local.cloudbase_role_arn
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.external_id
          }
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/SecurityAudit"
  ]
}

resource "aws_iam_role_policy" "cloudbase_cspm_read_policy" {
  name = "CloudbaseReadPolicy"
  role = aws_iam_role.cloudbase_role.id

  policy = file("${path.module}/policies/cspm_read_v20230210.json")
}

resource "aws_iam_role_policy" "cloudbase_container_scan_policy" {
  count = var.allow_container_scan_permissions ? 1 : 0

  name = "CloudbaseContainerScanPolicy"
  role = aws_iam_role.cloudbase_role.id

  policy = file("${path.module}/policies/container_scan_v20230210.json")
}

module "vm_scan" {
  count = var.allow_vm_scan_permissions ? 1 : 0
  source = "./module/vm_scan"
  base_iam_role_id = aws_iam_role.cloudbase_role.id
  kms_key_alias = "alias/${var.role_name}"
}