terraform {
  backend "s3" {
    bucket         = "eks-clusters/devops-assesment-cluster" 
    key            = "eks-cluster/terraform.tfstate"  
    region         = "eu-west-1" 
    encrypt        = true  
    dynamodb_table = "terraform-lock-table"
  }
}