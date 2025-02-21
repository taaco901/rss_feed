resource "aws_iam_policy" "iam_policy" {
  name   = var.policy_name
  policy = var.policy
  tags = {
    Name = var.policy_name
  }
}
