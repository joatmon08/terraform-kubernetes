# Using Terraform for Kubernetes Clusters

This example demonstrates how to use Terraform to create
Kubernetes clusters and deploy applications onto them
using Helm charts.

It uses Terraform Cloud pipelines to separate cluster
configuration and application deployment.

* Cluster Deployment - under `/cluster`
* Consul Deployment - deploys Consul to Kubernetes cluster. Under `/consul`.
* Vault Deployment - deploys Vault to connect with Consul backend. Under
  `/vault`.

  