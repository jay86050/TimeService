terraform {
  backend "s3" {
    bucket         = "platform91-terraform-state"
    key            = "env/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
