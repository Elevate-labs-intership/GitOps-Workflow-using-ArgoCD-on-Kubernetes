terraform {
  backend "s3" {
    bucket = "gitops-eleintern"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
