terraform {
  backend "s3" {
    bucket         = "hash-eks-terraform-state" 
    key            = "eks-clusters/devops-assesment-cluster/terraform.tfstate"  
    region         = "eu-north-1"
    encrypt        = true  
    dynamodb_table = "terraform-lock-table"
  }
}