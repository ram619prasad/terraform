output "bucket" {
    value = aws_s3_bucket.new_bucket.bucket
}

output "acl" {
    value = aws_s3_bucket.new_bucket.acl
}

output "arn" {
    value = aws_s3_bucket.new_bucket.arn
}

output "tags" {
    value = aws_s3_bucket.new_bucket.tags
}

output "versioning" {
    value = aws_s3_bucket.new_bucket.versioning
}

output "server_side_encryption_configuration" {
    value = aws_s3_bucket.new_bucket.server_side_encryption_configuration
}

output "lifecycle_rules" {
    value = aws_s3_bucket.new_bucket.lifecycle_rule[0]
}