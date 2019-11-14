output "default_queue_id" {
  value = module.SQS.default_queue_id
}

output "default_queue_arn" {
  value = module.SQS.default_queue_arn
}

output "default_queue_tags" {
  value = module.SQS.default_queue_tags
}

output "dead_letter_queue_id" {
  value = module.SQS.dead_letter_queue_id
}

output "dead_letter_queue_arn" {
  value = module.SQS.dead_letter_queue_arn
}

output "delay_queue_id" {
  value = module.SQS.delay_queue_id
}

output "delay_queue_arn" {
  value = module.SQS.delay_queue_arn
}

output "fifo_queue_id" {
  value = module.SQS.fifo_queue_id
}

output "fifo_queue_arn" {
  value = module.SQS.fifo_queue_arn
}