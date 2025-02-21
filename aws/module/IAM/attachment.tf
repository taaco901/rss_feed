resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
