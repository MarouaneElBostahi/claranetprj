data "aws_iam_policy_document" "task_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "ecs_role" {
  name               = "ecs-iam-role"
  assume_role_policy = data.aws_iam_policy_document.task_assume.json
}

resource "aws_iam_policy" "task_permissions" {
  name        = "ecs-iam-policy"
  description = "ECS Task Policy for ECS fargate containers"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": "ecs:UpdateService",
        "Resource": [
          "arn:aws:ecs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster/ecs-cluster",
          "arn:aws:ecs:*:${data.aws_caller_identity.current.account_id}:service/*/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "ecs:RegisterTaskDefinition",
          "ecr:GetAuthorizationToken",
          "ecs:ListTaskDefinitions",
          "ecs:DescribeTaskDefinition"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "${aws_cloudwatch_log_group.log_group.arn}:*"
      },
      {
        "Effect": "Allow",
        "Action": "ecr:*",
        "Resource": [
          aws_ecr_repository.ecr_word_press.arn
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "ecs:ExecuteCommand",
          "ecs:DescribeTasks"
        ],
        "Resource": "arn:aws:ecs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:task/*/*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "task_execution" {
  role       = aws_iam_role.ecs_role.id
  policy_arn = aws_iam_policy.task_permissions.arn
}

resource "aws_iam_role_policy_attachment" "task_execution_basic_policy" {
  role       = aws_iam_role.ecs_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
