# #!/bin/bash
# yum update -y
# yum install -y docker aws-cli


# systemctl start docker
# systemctl enable docker


# export ECR_URL="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
# export S3_BUCKET_API="${S3_BUCKET_API}"
# export ECR_API_NAME="${ECR_API_NAME}"
# export ECR_REVERS_NAME="${ECR_REVERS_NAME}"
# export AWS_REGION="${AWS_REGION}"

# aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

# mkdir -p /home/ec2-user/reverse_proxy
# aws s3 cp s3://${S3_BUCKET_API}/reverse_proxy/Dockerfile /home/ec2-user/reverse_proxy/Dockerfile
# aws s3 cp s3://${S3_BUCKET_API}/reverse_proxy/httpd.conf /home/ec2-user/reverse_proxy/httpd.conf


# docker build -t ${ECR_REVERS_NAME}:latest /home/ec2-user/reverse_proxy
# docker tag ${ECR_REVERS_NAME}:latest $ECR_URL/${ECR_REVERS_NAME}:latest
# docker push $ECR_URL/${ECR_REVERS_NAME}:latest


# mkdir -p /home/ec2-user/rest_api
# aws s3 cp s3://${S3_BUCKET_API}/rest_api/Dockerfile /home/ec2-user/rest_api/Dockerfile
# aws s3 cp s3://${S3_BUCKET_API}/rest_api/app.py /home/ec2-user/rest_api/app.py


# docker build -t ${ECR_API_NAME}:latest /home/ec2-user/rest_api
# docker tag ${ECR_API_NAME}:latest $ECR_URL/${ECR_API_NAME}:latest
# docker push $ECR_URL/${ECR_API_NAME}:latest
