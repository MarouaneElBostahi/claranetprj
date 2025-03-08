# resource "aws_iam_role" "ec2_role" {
#   name = "ec2-instance-profile"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "ec2_policy" {
#   name = "ec2_policy"
#   policy = jsonencode({
#     Version : "2012-10-17"
#     Statement : [
#       {
#         "Action" : [
#           "s3:*"
#         ],
#         "Effect" : "Allow",
#         "Resource" : [
#           "${aws_s3_bucket.app_bucket.arn}/*",
#         ]
#       },
#             {
#         "Action" : [
#           "ecr:*"
#         ],
#         "Effect" : "Allow",
#         "Resource" : [
#           "*"
#         ]
#       }
#     ]
#   })
# }

# resource "aws_iam_instance_profile" "ec2_instance_profile" {
#   name = "ec2-instance-profile"
#   role = aws_iam_role.ec2_role.name

# }

# resource "aws_iam_role_policy_attachment" "ssm_attach_ec2" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_role_policy_attachment" "ec2_attach_ec2" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = aws_iam_policy.ec2_policy.arn
# }

