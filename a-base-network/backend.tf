terraform {
  backend "s3" {
    bucket         = "eti-eks-terraform-backend-store"
    key            = "tfstate/eks_base_network"
    region         = "eu-west-1" # Used the nearest AWS region
    dynamodb_table = "eti_infra_builder_state_lock" # Using a DynamoDB lock to disable concurrent access to the tfstate
  }
}
