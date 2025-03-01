variable "topic_name" {
  type = string
}

variable "subscription_name" {
  type = string
}


variable "push_endpoint_url" {
  type        = string
  description = "value of the Cloud Function URL"
}
