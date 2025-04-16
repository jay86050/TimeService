variable "region" {
  default = "us-west-2"
}

variable "image_url" {
  description = "Docker image to deploy"
  default     = "994180630371.dkr.ecr.us-west-2.amazonaws.com/simple-time-service:latest"
}

variable "app_port" {
  default = 5000
}
