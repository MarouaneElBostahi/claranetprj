# Cloud Infrastructure Assessment

## Purpose
This assessment evaluates your knowledge of "state of the art" cloud solutions, particularly AWS, with a focus on Linux system administration and cloud orchestration.

## Objectives
The goal is to blueprint and, where possible, implement the following infrastructure:
1. **ECS Cluster**:
   - Include all necessary network resources.  :white_check_mark:
2. **Microservices**:
   - **Reverse Proxy Application**:  :x:
     - Publicly accessible.
     - Routes traffic to the simple REST application.
     - Use Nginx (preferred) or Apache.
     - Include a Dockerfile.
   - **Instead of using a reverse proxy as Entry Point i used an ALB that are publicly available**  :white_check_mark:
   - **Simple REST Application**:  :white_check_mark:
     - Private access only.
     - Preferred language: Python.
     - Include a Dockerfile.
3. **CloudWatch Alarm**:  :white_check_mark:
   - Create at least one CloudWatch Alarm suitable for a production environment.

## Requirements
The following tools and resources are mandatory:
- **AWS Free Tier Resources**:
  - [AWS Free Tier](https://aws.amazon.com/it/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)
- **Terraform**:
  - To define and manage the infrastructure as code.
- **Bash/Python**:
  - For scripting as needed.

## Deliverables
- Infrastructure blueprint using **Terraform**.  :white_check_mark:
- Dockerfiles for both microservices.  :white_check_mark:
- CloudWatch Alarm configuration.  :white_check_mark:
- (Optional) A functional script or set of scripts demonstrating the setup.  :white_check_mark:

## Bonus Objectives
Additional features to earn bonus points:
1. **Security Best Practices**:  :white_check_mark:
   - Implement at least 5 best practices in the infrastructure.
2. **Log Collection**:  :white_check_mark:
   - Collect logs for the microservices.
3. **Auto-scaling Policies**:  :white_check_mark:
   - Define auto-scaling configurations for the ECS cluster or microservices.
4. **CI/CD Pipeline**:
   - Create a pipeline for one microservice using:
     - AWS CodePipeline
     - GitHub Actions
     - GitLab CI/CD
5. **Architecture Diagram**:
   - Illustrate an ETL flow related to the application.

## Submission
- **Timeline**: 5 days from receipt of the assessment.
- Provide the solution in a structured repository format, including:
  - Terraform configuration files.
  - Dockerfiles.
  - Scripts (if any).
  - Documentation or notes for setup and execution.

## Evaluation Criteria
The assessment will be evaluated based on:
- **Solution Design**: Choice of tools and overall approach.
- **Simplicity & Efficiency**: Easy-to-understand and performant implementation.
- **Security**: Adherence to best practices.
- **Completeness**: Fulfillment of all mandatory and bonus objectives.
