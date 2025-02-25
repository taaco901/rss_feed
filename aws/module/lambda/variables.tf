variable "source_file_path" {
  type    = string
  default = "C:\\Windows\\PJ\\rss_feed\\rss_feed\\python\\main.zip"
}
variable "function_name" {
  type = string
}
variable "role_arn" {
  type = string
}
variable "layers" {
  type    = list(string)
  default = []
}
variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "time_out" {
  type    = number
  default = 60
}
variable "memory_size" {
  type    = number
  default = 128
}
