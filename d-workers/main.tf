provider "aws" {
  region = "me-south-1"
}

################################################
# Bastion machine
################################################
resource "aws_instance" "bastion" {
  # choose ami and instance type and create and setup the bastion machine 
}

################################################ 
# launch template
################################################
resource "aws_launch_template" "eks_worker_launch_template" {
  name                   = "eti-worker-group-launch-template"
  
  # Setup the launch template for the workers. To be used by the Auto-scaling group to instanciate new workers 
}

################################################
# Workers Node Group
################################################
resource "aws_eks_node_group" "worker_node_group" {
  cluster_name    = "eti-k8s-cluster"
  node_group_name = "eti-worker-group"

  scaling_config {
    # define scqling config
  }

  launch_template {
    id      = aws_launch_template.eks_worker_launch_template.id
    version = aws_launch_template.eks_worker_launch_template.latest_version
  }
}
