output "cf_url" {
  value = google_cloudfunctions_function.cf.https_trigger_url
}
