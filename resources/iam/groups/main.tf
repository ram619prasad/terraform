resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group_policy_attachment" "AdminPolicy" {
  group = "${aws_iam_group.admins.name}"
  policy_arn = var.policies["Admin_Access"]
}
