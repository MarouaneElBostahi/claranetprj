#!/bin/bash
yum update -y
yum install -y docker aws-cli

systemctl start docker
systemctl enable docker

export WORDPRESS_VERSION=${WORDPRESS_VERSION}
export ACCOUNT_ID=${ACCOUNT_ID} 
export AWS_REGION=${AWS_REGION}
export ECR_WORDPRESS_NAME=${ECR_WORDPRESS_NAME}
export ECR_URL=${ECR_URL}

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

echo "Pulling WordPress image: wordpress:${WORDPRESS_VERSION}"
docker pull wordpress:${WORDPRESS_VERSION}
docker tag wordpress:${WORDPRESS_VERSION} ${ECR_URL}/${ECR_WORDPRESS_NAME}:${WORDPRESS_VERSION}
docker push ${ECR_URL}/${ECR_WORDPRESS_NAME}:${WORDPRESS_VERSION}
