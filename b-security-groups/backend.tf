terraform {
  backend "s3" {
    bucket         = "eti-eks-terraform-backend-store"
    key            = "tfstate/eks_asg"
    region         = "me-south-1"
    dynamodb_table = "eti_infra_builder_state_lock"
  }
}
