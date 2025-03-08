locals {
  vars = {
    AWS_REGION      = data.aws_region.current.name
    ACCOUNT_ID    = data.aws_caller_identity.current.account_id
    ECR_WORDPRESS_NAME = aws_ecr_repository.ecr_word_press.name
    WORDPRESS_VERSION  = var.wordpress_version
     ECR_URL            = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
  }
}
