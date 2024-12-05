terraform {
  backend "s3" {
    bucket = "tg-sastikroot1"
    key    = "s3://tg-sastikroot1/data/terraform.tfstate"

  }
}