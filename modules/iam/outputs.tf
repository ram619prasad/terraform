output "AdminGroupID" {
  value = module.iam.id
}

output "AdminGroupARN" {
  value = module.iam.arn
}

output "AdminGroupName" {
  value = module.iam.name
}

output "UserName" {
  value = module.users.name
}

output "UserTags" {
  value = module.users.tags
}

