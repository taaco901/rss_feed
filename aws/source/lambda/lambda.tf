module "rssfeed_lambda" {
  source           = "../../module/lambda"
  source_file_path = "D:\\AWS\\RSS\\rss_feed\\python\\main.zip"

  for_each = { for lambda_settings in local.lambda_settings : lambda_settings.function_name => lambda_settings }

  role_arn              = each.value.role_arn
  function_name         = each.value.function_name
  layers                = each.value.layers
  environment_variables = each.value.environment_variables
}
