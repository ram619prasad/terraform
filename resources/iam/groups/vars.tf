variable "policies" {
  type = "map"
  default = {
    "Admin_Access" = "arn:aws:iam::aws:policy/AdministratorAccess"
    "S3_Full_Access" = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    "EC2_Full_Access" = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  }
}

