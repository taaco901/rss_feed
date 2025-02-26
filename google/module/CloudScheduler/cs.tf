resource "google_cloud_scheduler_job" "sj" {
  name        = var.scheduler_name
  description = var.scheduler_description
  schedule    = var.schedule

  time_zone = var.time_zone

  http_target {
    http_method = var.http_method
    uri         = var.uri
    headers = {
      "Content-Type" = "application/json"
    }
    body = ""
  }
}
