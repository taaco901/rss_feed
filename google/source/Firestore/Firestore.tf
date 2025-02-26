module "rss_firestore" {
  source = "../../module/Firestore"

  project_id = local.Firestore_settings.project_id

}
