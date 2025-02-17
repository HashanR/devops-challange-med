aws_region         = "eu-north-1"
cluster_name       = "devops-assesment-cluster"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]