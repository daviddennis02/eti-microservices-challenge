provider "aws" {
  region = "eu-west-1"
}

###############################################################
# Configure SNS for Email notification 
###############################################################
resource "aws_sns_topic" "eti_sns_topic" {
  name         = "eti_sns_topic"
  display_name = "eti SNS Topic"
}

# Enable and configure some SNS subscriptions to receive notifications from the eti_sns_topic



###############################################################
# AWS Elasticsearch Alert based on cluster status
###############################################################
resource "aws_cloudwatch_metric_alarm" "eti_aws_es_cluster_status" {
  # define some cloudwatch alarms based on elastic search metrics
} 
 