output "default_queue_id" {
  value = aws_sqs_queue.standard_queue.id
}

output "default_queue_arn" {
  value = aws_sqs_queue.standard_queue.arn
}

output "default_queue_tags" {
  value = aws_sqs_queue.standard_queue.tags
}

output "dead_letter_queue_id" {
  value = aws_sqs_queue.dead_letter_queue.id
}

output "dead_letter_queue_arn" {
  value = aws_sqs_queue.dead_letter_queue.arn
}

output "delay_queue_arn" {
  value = aws_sqs_queue.delay_queue.arn
}

output "delay_queue_id" {
  value = aws_sqs_queue.delay_queue.id
}

output "fifo_queue_id" {
  value = aws_sqs_queue.fifo_queue.id
}

output "fifo_queue_arn" {
  value = aws_sqs_queue.fifo_queue.arn
}