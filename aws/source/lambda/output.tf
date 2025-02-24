output "lambda_names" {
  description = "各 Lambda 関数の名前を出力"
  value = {
    for key, lambda_module in module.rssfeed_lambda : key => lambda_module.lambda_name
  }
}

output "lambda_arns" {
  description = "各 Lambda 関数の ARN を出力"
  value = {
    for key, lambda_module in module.rssfeed_lambda : key => lambda_module.lambda_arn
  }
}
