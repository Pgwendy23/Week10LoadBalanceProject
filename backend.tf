terraform {
  backend "s3" {
    bucket         = "week10bucketg4"
    key            = "week10/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "week10dynamo"
  }
}