terraform {
  backend "s3" {
    bucket         = "eti-eks-terraform-backend-store"
    key            = "tfstate/eks_ingress"
    region         = "eu-west-1"
    dynamodb_table = "eti_infra_builder_state_lock"
  }
}
