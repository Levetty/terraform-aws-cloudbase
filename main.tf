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
}

resource "aws_iam_role_policy_attachment" "cloudbase_security_audit_policy" {
  role       = aws_iam_role.cloudbase_role.id
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_role_policy_attachment" "cloudbase_cspm_read_policy" {
  count      = 4
  role       = aws_iam_role.cloudbase_role.id
  policy_arn = aws_iam_policy.cloudbase_cspm_read_policy[count.index].arn
}

resource "aws_iam_policy" "cloudbase_cspm_read_policy" {
  count = 4
  name  = "${var.cspm_policy_prefix}${count.index}"

  policy = file("${path.module}/policies/cspm_read_${count.index}.json")
}

resource "aws_iam_role_policy" "cloudbase_container_scan_policy" {
  count = var.allow_container_scan_permissions ? 1 : 0

  name = "CloudbaseContainerScanPolicy"
  role = aws_iam_role.cloudbase_role.id

  policy = file("${path.module}/policies/container_scan.json")
}

module "vm_scan" {
  count            = var.allow_vm_scan_permissions ? 1 : 0
  source           = "./module/vm_scan"
  base_iam_role_id = aws_iam_role.cloudbase_role.id
  kms_key_alias    = "alias/${var.role_name}"
}

resource "aws_iam_role_policy" "cloudbase_function_scan_policy" {
  count = var.allow_function_scan_permissions ? 1 : 0

  name = "CloudbaseLambdaScanPolicy"
  role = aws_iam_role.cloudbase_role.id

  policy = file("${path.module}/policies/lambda_scan.json")
}

resource "aws_iam_role_policy_attachment" "cloudbase_cloudtrail_read_policy" {
  count = var.allow_cloudtrail_read_permissions ? 1 : 0

  role       = aws_iam_role.cloudbase_role.id
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudTrail_ReadOnlyAccess"
}

output "role_arn" {
  value       = aws_iam_role.cloudbase_role.arn
  description = "The ARN of the IAM role created for Cloudbase."
}
