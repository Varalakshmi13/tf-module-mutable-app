data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-gvl"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "terraform-gvl"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "ansiblebotoincluded"
  owners      = ["self"]
}