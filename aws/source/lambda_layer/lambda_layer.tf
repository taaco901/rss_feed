module "feedparser_layer" {
  source              = "../../module/lambda_layer"
  layer_name          = local.lambda_layer.feedparser.name
  layer_description   = local.lambda_layer.feedparser.description
  compatible_runtimes = local.lambda_layer.feedparser.compatible_runtimes
  layer_zip_path      = local.lambda_layer.feedparser.zip_path
}
