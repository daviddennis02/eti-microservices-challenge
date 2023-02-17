provider "aws" {
  region = "eu-west-1"
}

#############################################
# Create CloudWatch Group
#############################################
resource "aws_cloudwatch_log_group" "cloudwatch" {
  name              = "aiq-k8s-cloudwatch"
  retention_in_days = 90
}

#############################################
# Create EKS Cluster
#############################################
resource "aws_eks_cluster" "eks" {
  name                      = "aiq-k8s-cluster"
  version                   = "1.21"

  vpc_config {
    # to complete, vpc, subnets ...
  }
}

#############################################
# Generate kubeconfig files
#############################################
resource "local_file" "kubeconfig" {
  content    = local.kubeconfig
  filename   = pathexpand("~/.kube/config")
  depends_on = [aws_eks_cluster.eks]
}
