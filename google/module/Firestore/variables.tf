variable "firestore_db_name" {
  type    = string
  default = "(default)"
}
variable "project_id" {
  type = string
}
variable "location" {
  type    = string
  default = "asia-northeast1"
}
variable "type" {
  type    = string
  default = "FIRESTORE_NATIVE"
}
