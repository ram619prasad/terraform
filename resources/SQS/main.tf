// 1. Create a standard queue
//       a. with a 2 mins visibility timeout
//       b. with 3 days rentention period
//       c. Max Msg Size: 256KB
//       d. Delay delivery: 0
// 2. Create a DLQ(Dead Letter Queue)
// 3. Add a redrive-policy to move messages to DLQ after 3 retries from StandardQueue.
resource "aws_sqs_queue" "standard_queue" {
  name = var.standard_queue_name
  visibility_timeout_seconds = 120
  message_retention_seconds = 259200
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dead_letter_queue.arn}\",\"maxReceiveCount\":3}"

  tags = {
    Name = "sample_sqs"
  }
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name = var.dead_letter_queue_name
}

// Create a delay queue with 2 mins delay in sending msg to the queue
resource "aws_sqs_queue" "delay_queue" {
  name = var.delay_queue_name
  delay_seconds = 120
}

// create a FIFO Queue with content based de-duplication enabled.
resource "aws_sqs_queue" "fifo_queue" {
  name = var.fifo_queue_name
  fifo_queue = true
  content_based_deduplication = true
}