terraform {
  backend "s3" {
    bucket = "terraform-visual-september"
    key    = "eks/infrastructure/data.tfvars"
    region = "us-east-1"
  }
}