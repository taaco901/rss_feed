module "checkRSSFeeds" {
  source = "../../module/CloudFunction"

  for_each = { for cf_settings in local.CloudFunction_settings : cf_settings.cf_name => cf_settings }

  bucket_name = each.value.source_bucket_name
  project_id  = each.value.project_id
  object_name = each.value.source_object_name
  source_obj  = each.value.source_obj
  cf_name     = each.value.cf_name
}

