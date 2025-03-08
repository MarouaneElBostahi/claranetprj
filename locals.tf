locals {
  vars = {
    S3_BUCKET_API = aws_s3_bucket.app_bucket.bucket
    AWS_REGION    = "eu-west-1"
    ACCOUNT_ID    = data.aws_caller_identity.current.account_id
    ECR_REVERS_NAME = aws_ecr_repository.ecr_reverse_proxy.name
    ECR_API_NAME    = aws_ecr_repository.ecr_rest_api.name
  }
}
