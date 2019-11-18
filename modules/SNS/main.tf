module "email_sns_topic" {
  source = "../../resources/SNS"

  email_topic_name = "email_notifications"
  subscription_email = "ram.prasad@mailinator.com"
}