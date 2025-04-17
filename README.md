```markdown
# Simple Time Service

This repository contains a simple time service application that can be deployed using Docker and Terraform. The application provides the current time when accessed via an API endpoint.

👉 **Access the live application**: [http://app-alb-1026595973.us-west-2.elb.amazonaws.com](http://app-alb-1026595973.us-west-2.elb.amazonaws.com)

---

## Directory Structure


├── README.md                # This file
├── app                      # Application source code
│   ├── Dockerfile           # Dockerfile for building the application image
│   └── app.py               # Python script for the time service
└── terraform                # Terraform configuration files
    ├── backend.tf           # Backend configuration for Terraform state
    ├── main.tf              # Main Terraform configuration
    ├── provider.tf          # Provider configuration (e.g., AWS)
    ├── terraform.tfstate    # Terraform state file (do not modify manually)
    ├── terraform.tfstate.backup # Backup of Terraform state
    └── variables.tf         # Input variables for Terraform
```

---

## Features

✅ Dockerized Flask app pushed to ECR  
✅ AWS infrastructure provisioned via Terraform  
✅ ECS Fargate task running for app securely  
✅ Public access through an Application Load Balancer  
✅ VPC with public/private subnet architecture  

---

## How to Use

### Running the Application Locally

To run the application locally using Docker:

1. Navigate to the `app` directory:
   ```bash
   cd app
   ```

2. Build the Docker image:
   ```bash
   docker build -t gjay02194/simpletimeservice:latest .
   ```

3. Run the Docker container:
   ```bash
   docker run -p 5000:5000 gjay02194/simpletimeservice:latest
   ```

4. Access the application:
   Open your browser or use `curl` to access the API endpoint:
   ```bash
   curl http://localhost:5000/time
   ```
   The response will be in JSON format, e.g.:
   ```json
   {
     "current_time": "2023-10-01T12:34:56Z"
   }
   ```

---

### Deploying with Terraform

To deploy the application using Terraform:

1. Navigate to the `terraform` directory:
   ```bash
   cd terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the Terraform plan:
   ```bash
   terraform plan
   ```

4. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
   Confirm the deployment by typing `yes` when prompted.

5. Once deployed, Terraform will output the public IP or DNS of the deployed service. Access the application using the provided endpoint:
   ```bash
   curl http://<ALB-DNS>/time
   ```

---

### Using the Docker Image from Docker Hub

The Docker image for this application is available on Docker Hub at `gjay02194/simpletimeservice:latest`. You can pull and run it directly without building locally.

1. Pull the image:
   ```bash
   docker pull gjay02194/simpletimeservice:latest
   ```

2. Run the container:
   ```bash
   docker run -p 5000:5000 gjay02194/simpletimeservice:latest
   ```

3. Access the application as described in the "Running the Application Locally" section.

---

## Infrastructure Highlights

- **Dockerized Flask App**: The application is containerized and pushed to Amazon Elastic Container Registry (ECR).  
- **AWS ECS Fargate**: The app runs securely in ECS Fargate, ensuring scalability and minimal operational overhead.  
- **Application Load Balancer (ALB)**: Public access is provided through an ALB, which routes traffic to the ECS tasks.  
- **VPC Architecture**: The infrastructure uses a VPC with public and private subnets for secure networking.  
- **Terraform State Management**:
  - **Remote Storage**: Terraform state is stored remotely in an S3 bucket, ensuring it is shared and safe.  
  - **State Locking**: DynamoDB is used to lock the state, preventing simultaneous runs and potential conflicts.  

---


