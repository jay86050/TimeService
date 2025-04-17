Simple Time Service
This repository contains a simple time service application that can be deployed using Docker and Terraform. The application provides the current time when accessed via an API endpoint.

Directory Structure
├── README.md                  # This file
├── app                        # Application source code
│   ├── Dockerfile             # Dockerfile for building the application image
│   └── app.py                 # Python script for the time service
└── terraform                  # Terraform configuration files
    ├── backend.tf             # Backend configuration for Terraform state
    ├── main.tf                # Main Terraform configuration
    ├── provider.tf            # Provider configuration (e.g., AWS)
    ├── terraform.tfstate      # Terraform state file (do not modify manually)
    ├── terraform.tfstate.backup # Backup of Terraform state
    └── variables.tf           # Input variables for Terraform
Awesome! Your App is LIVE at:
👉 http://app-alb-1026595973.us-west-2.elb.amazonaws.com


✅ Dockerized Flask app pushed to ECR
✅ AWS infrastructure provisioned via Terraform
✅ ECS Fargate task running For app securely
✅ Public access through an Application Load Balancer
✅ VPC with public/private subnet architecture

How to Use
1. Running the Application Locally
To run the application locally using Docker:

Navigate to the app directory:

cd app

Build the Docker image:


docker build -t gjay02194/simpletimeservice:latest .

Run the Docker container:

docker run -p 5000:5000 gjay02194/simpletimeservice:latest

Access the application:

Open  browser or use curl to access the API endpoint:

curl http://localhost:5000/time
The response will be in JSON format, e.g.:

{
    "current_time": "2023-10-01T12:34:56Z"
}

2. Deploying with Terraform
To deploy the application using Terraform:

Navigate to the terraform directory:

cd terraform
Initialize Terraform:

terraform init
Review the Terraform plan:

terraform plan

Apply the Terraform configuration:

terraform apply
Confirm the deployment by typing yes when prompted.
Once deployed, Terraform will output the public IP or DNS of the deployed service. Access the application using the provided endpoint:

curl http://<public-ip-or-dns>/time

3. Using the Docker Image from Docker Hub
The Docker image for this application is available on Docker Hub at gjay02194/simpletimeservice:latest. You can pull and run it directly without building locally:

Pull the image:

docker pull gjay02194/simpletimeservice:latest

Run the container:

docker run -p 5000:5000 gjay02194/simpletimeservice:latest

Access the application as described in the "Running the Application Locally" section.

Infrastructure Highlights
Dockerized Flask App : The application is containerized and pushed to Amazon Elastic Container Registry (ECR).
AWS ECS Fargate : The app runs securely in ECS Fargate, ensuring scalability and minimal operational overhead.
Application Load Balancer (ALB) : Public access is provided through an ALB, which routes traffic to the ECS tasks.
VPC Architecture : The infrastructure uses a VPC with public and private subnets for secure networking.
Terraform State Management :
Remote Storage : Terraform state is stored remotely in an S3 bucket, ensuring it is shared and safe.
State Locking : DynamoDB is used to lock the state, preventing simultaneous runs and potential conflicts.
Customization
Modify the Application : Edit the app/app.py file to customize the behavior of the time service.
Update Terraform Configuration : Modify the terraform/main.tf file to adjust the infrastructure settings (e.g., instance type, region).
Contributing
Contributions are welcome! If you find any issues or have suggestions for improvemnt 
