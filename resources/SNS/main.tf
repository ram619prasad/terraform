# Objectives
#   1. Create a topic for email notifications
#   2. Add a subscription for the topic

resource "aws_sns_topic" "email_topic" {
  name = var.email_topic_name
  display_name = var.email_topic_name

  # Currently terraform doesn't support email or email.json protocols
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.subscription_email}"
  }

  tags = {
    Name = var.email_topic_name
  }
}
