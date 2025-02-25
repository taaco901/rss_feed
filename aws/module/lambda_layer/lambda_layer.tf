resource "aws_lambda_layer_version" "lambda_layer" {
  filename            = var.layer_zip_path
  layer_name          = var.layer_name
  description         = var.layer_description
  compatible_runtimes = var.compatible_runtimes

  source_code_hash = filesha256(var.layer_zip_path) # ZIPの変更を検知

  lifecycle {
    create_before_destroy = true # Layerの更新でダウンタイムを防ぐ
  }
}
