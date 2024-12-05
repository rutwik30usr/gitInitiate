resource "aws_s3_bucket" "swstikroot" {
  bucket = "tg-sastikroot1"

  tags = {
    name        = "tg-sastikroot"
    Environment = "dev"
  }

}