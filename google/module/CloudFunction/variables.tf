variable "bucket_name" {
  type = string
}
variable "project_id" {
  type = string
}
variable "location" {
  type    = string
  default = "asia-northeast1"
}
variable "object_name" {
  type = string
}
variable "source_obj" {
  type = string
}
variable "cf_name" {
  type = string
}
variable "runtime" {
  type    = string
  default = "python312"
}
variable "entry_point" {
  type    = string
  default = "fetch_and_store_rss"
}

