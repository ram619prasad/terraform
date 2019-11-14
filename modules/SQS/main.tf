module "SQS" {
  source = "../../resources/SQS"

  standard_queue_name = var.standard_queue_name
  dead_letter_queue_name = var.dead_letter_queue_name
  delay_queue_name = var.delay_queue_name
  fifo_queue_name = var.fifo_queue_name
}