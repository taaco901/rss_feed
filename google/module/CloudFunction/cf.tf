resource "google_storage_bucket" "sb" {
  name     = var.bucket_name
  project  = var.project_id
  location = var.location
}
resource "google_storage_bucket_object" "sbo" {
  name   = var.object_name
  bucket = google_storage_bucket.sb.name
  source = var.source_obj
}

resource "google_cloudfunctions_function" "cf" {
  name        = var.cf_name
  project     = var.project_id
  runtime     = var.runtime
  entry_point = var.entry_point

  source_archive_bucket = google_storage_bucket.sb.name
  source_archive_object = google_storage_bucket_object.sbo.name

  trigger_http = true
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.cf.project
  region         = google_cloudfunctions_function.cf.region
  cloud_function = google_cloudfunctions_function.cf.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
