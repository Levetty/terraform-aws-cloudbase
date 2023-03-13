resource "aws_kms_key" "shared" {
  policy = jsonencode({
    "Version": "2012-10-17",
    "Id": "policy-1",
    "Statement": [
      {
        "Sid": "Enable IAM User Permissions",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": "kms:*",
        "Resource": "*"
      },
      {
        "Sid": "allow encrypt and decrypt to Cloudbase",
        "Effect": "Allow",
        "Principal": {
          "AWS": local.vm_launcher_role
        },
        "Action": [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource": "*"
      },
      {
        "Sid": "allow grant to Cloudbase",
        "Effect": "Allow",
        "Principal": {
          "AWS": local.vm_launcher_role
        },
        "Action": [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        "Resource": "*"
      }
    ]
  })
  enable_key_rotation = true
}

resource "aws_kms_alias" "shared" {
  target_key_id = aws_kms_key.shared.id
  name = var.kms_key_alias
}