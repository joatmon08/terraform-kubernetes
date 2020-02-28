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

# Step 1: Deploy a Kubernetes Cluster

You'll need to specify the variables in `variables.tf` and load them
into Terraform Cloud.

It will output the Kubernetes credentials for consumption by the
Helm charts.

# Step 2: Deploy Consul backend for Vault

In Terraform Cloud, you'll need to specify a __Run Trigger__
that uses the Kubernetes cluster deployment's workspace. The Consul
backend deployment will exist in a different workspace entirely in
order to separate cluster configuration from Consul deployment.

You'll need to specify variables in `variables.tf` within
the Terraform Cloud workspace for the Consul deployment.

# Step 3: 