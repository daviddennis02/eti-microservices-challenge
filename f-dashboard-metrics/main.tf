provider "aws" {
  region = "eu-west-1"
}

#######################################
# Create Namespace Monitoring
#######################################
resource "kubernetes_namespace" "kubernetes-dashboard" {
  metadata {
    name = "kubernetes-dashboard"
    labels = {
      allow-internet-traffic = "true"
      name                   = "kubernetes-dashboard"
    }
  }
}

#################################################
# Install EKS Dashboard and Metrics Server
##################################################
resource "helm_release" "dashboard" {
  name       = "dashboard-server"
  repository = "https://kubernetes.github.io/dashboard"
  chart      = "kubernetes-dashboard"
  namespace  = "kubernetes-dashboard" 

  # ...
}

resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  namespace  = "kubernetes-dashboard"

  # ...
}