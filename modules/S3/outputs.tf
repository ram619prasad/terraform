output "bucket" {
  value = module.S3.bucket
}

output "arn" {
  value = module.S3.arn
}

output "acl" {
  value = module.S3.acl
}

output "tags" {
  value = module.S3.tags
}

output "versioning" {
  value = module.S3.versioning
}

output "server_side_encryption_configuration" {
  value = module.S3.server_side_encryption_configuration
}

output "lifecycle_rules" {
    value = module.S3.lifecycle_rules
}
