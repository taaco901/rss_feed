variable "scheduler_name" {
  type = string
}
variable "scheduler_description" {
  type = string
}
variable "schedule" {
  type = string
}

variable "time_zone" {
  type    = string
  default = "Asia/Tokyo"
}

variable "http_method" {
  type    = string
  default = "POST"
}
variable "uri" {
  type = string
}
