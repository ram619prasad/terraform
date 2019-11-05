resource "aws_iam_user" "ram" {
  name = "ram"

  tags = {
    name = "ram"
  }
}

resource "aws_iam_user_group_membership" "admins" {
    user = var.user_name
    groups = [
        var.user_group
    ]
}