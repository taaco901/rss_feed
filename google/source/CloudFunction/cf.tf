module "checkRSSFeeds" {
  source      = "../../module/CloudFunction"
  bucket_name = local.CloudFunction_settings.source_bucket_name
  project_id  = local.CloudFunction_settings.project_id
  object_name = local.CloudFunction_settings.source_object_name
  source_obj  = local.CloudFunction_settings.source_obj
  cf_name     = local.CloudFunction_settings.cf_name
}

