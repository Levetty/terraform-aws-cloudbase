resource "aws_iam_role_policy" "cloudbase_vm_scan_policy" {
  name = "CloudbaseVMScanPolicy"
  role = var.base_iam_role_id

  policy = templatefile("${path.module}/../../policies/vm_scan.json", {
    sharedKmsArn = aws_kms_key.shared.arn
  })
}
