resource "aws_lambda_function" "lambda" {
  filename      = var.source_file_path
  function_name = var.function_name
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  timeout     = var.time_out
  memory_size = var.memory_size

  layers = var.layers

  /*
  lifecycle {
    ignore_changes = [
      filename,
      source_code_hash
    ]
  }
  */

  tags = {
    Name = var.function_name
  }
}


