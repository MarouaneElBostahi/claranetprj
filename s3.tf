# resource "random_string" "random" {
#   length  = 16
#   special = false
#   upper   = false
#   numeric = false
# }

# resource "aws_s3_bucket" "app_bucket" {
#   bucket = "appbucket${random_string.random.result}"
# }


# resource "null_resource" "rest_api_folder" {
#   provisioner "local-exec" {
#     command = "aws s3 sync ./application/ s3://${aws_s3_bucket.app_bucket.bucket}"
#   }
# }

