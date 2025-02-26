
resource "google_firestore_database" "fs" {
  name        = var.firestore_db_name
  project     = var.project_id
  location_id = var.location
  type        = var.type
}

