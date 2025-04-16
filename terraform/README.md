# 🚀 Simple Time Service - Terraform AWS ECS Deployment

This project deploys a simple Python Flask containerized app to AWS using Terraform. The infrastructure includes a secure VPC, ECS Cluster with Fargate tasks, an Application Load Balancer (ALB), and an ECR-hosted Docker image.

---

## 📦 Project Structure

.
├── app               # Flask app with Dockerfile
└── terraform         # Terraform files to create infrastructure

---

## 🌐 Live App

Your app is deployed at:

👉 http://app-alb-1026595973.us-west-2.elb.amazonaws.com

---

## 🔐 Prerequisites

- AWS CLI installed and configured
- Docker installed
- Terraform installed

---

## 🔑 AWS Setup

Before running Terraform, you need to authenticate with AWS.

```bash
aws configure


Enter your:

AWS Access Key ID

AWS Secret Access Key

Region: us-west-2

Output format: json

🐳 Docker Setup
1. Authenticate Docker with ECR
bash
Copy
Edit
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 994180630371.dkr.ecr.us-west-2.amazonaws.com
2. Build & Push the Image
bash
Copy
Edit
cd app
docker build -t simple-time-service .
docker tag simple-time-service 994180630371.dkr.ecr.us-west-2.amazonaws.com/simple-time-service:latest
docker push 994180630371.dkr.ecr.us-west-2.amazonaws.com/simple-time-service:latest
🌍 Deploy Infrastructure
1. Go to Terraform directory
bash
Copy
Edit
cd terraform
2. Initialize Terraform
bash
Copy
Edit
terraform init
3. Preview Plan
bash
Copy
Edit
terraform plan
4. Apply
bash
Copy
Edit
terraform apply
✅ Confirm with yes when prompted.

📁 Files Overview
provider.tf: AWS provider config

main.tf: All infrastructure (VPC, ECS, ALB, etc.)

variables.tf: Configurable values (region, image, port)

terraform.tfvars (optional): Your custom values

.gitignore: Avoid committing sensitive files
