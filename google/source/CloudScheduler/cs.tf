module "rss-fetch-scheduler" {
  source = "../../module/CloudScheduler"

  scheduler_name        = local.CloudScheduler_settings.name
  scheduler_description = local.CloudScheduler_settings.description
  schedule              = local.CloudScheduler_settings.schedule
  uri                   = local.CloudScheduler_settings.uri

}
