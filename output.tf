output "lambda_arn" {
    value= aws_lambda_function.hello.arn
  
}

output "sqs_arn" {
  value = aws_sqs_queue.mysqs.arn
}