## logging_stack

The module logging_stack will :

* Create logging NS in the EKS Cluster
* Provision AWS ES Service
* Install and configure Fluentd in the EKS Cluster to send logs to Elasticsearch cluster
* Install and configure Nginx Reverse Proxy to give access to kibana

## Requirements

* Terrafrom version ~> 1.13.x
* EKS Cluster UP and Running
