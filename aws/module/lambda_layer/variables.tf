variable "layer_zip_path" {
  type = string
}
variable "layer_name" {
  type = string
}
variable "layer_description" {
  type = string
}
variable "compatible_runtimes" {
  type    = list(string)
  default = ["python3.12"]
}
