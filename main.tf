provider "aws" {
    region = "us-east-1"
}

# IAM role for Lambda execution
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "example" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_function" "hello" {
    function_name = var.function_name
    handler = "lambda_function.lambda_handler"
    role= aws_iam_role.example.arn
    runtime = "python3.9"
    filename = "lambda.zip"
    source_code_hash = base64sha256("lambda.zip")
    }

    resource "aws_sqs_queue" "mysqs" {
        name = var.queue_name
        delay_seconds = var.delay_seconds
        sqs_managed_sse_enabled = true
       
    }
