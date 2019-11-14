variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type    = "string"
  default = "your access key here"
}

variable "AWS_SECRET_KEY" {
  type    = "string"
  default = "your secret key here"
}

variable "standard_queue_name" {
  default = "standard_queue"
}

variable "dead_letter_queue_name" {
  default = "dead_letter_queue"
}

variable "delay_queue_name" {
  default = "delay_queue"
}

variable "fifo_queue_name" {
  default = "fifo_queue.fifo"
}