provider "aws" {
  region = "me-south-1"
}


########################################################################
# Create S3 bucket for backup                                          # 
########################################################################
resource "aws_s3_bucket" "bucket_backup" {
  bucket        = "eti-backup-bucket"
  acl           = "private"

  versioning {
    enabled = var.versioning_enabled # should enable versionning to schedule replication
  }

  lifecycle_rule {
    # define backup S3 lifecycle rules 
  }
}


########################################################################
# Create NS velero                                                     # 
########################################################################
resource "kubernetes_namespace" "velero" {
  metadata {
    name = "velero"
    labels = {
      allow-internet-traffic = "true"
      name                   = "velero"
    }
  }
}

########################################################################
# Install velero  using helm                                           # 
########################################################################
resource "helm_release" "velero" {
  name       = "velero"
  repository = "https://vmware-tanzu.github.io/helm-charts"
  chart      = "velero"
  namespace  = "velero"
  
  # setup custom velero config
}
 