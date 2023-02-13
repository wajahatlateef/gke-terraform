# gke-terraform
This terraform code is expecting to create VPC, subnets, GKE cluster and nodepool on GCP environment.
To authenticate with GCP we are generating the keys for service account and adding relative path to kube config file and keys file in terraform code.

To initialize the terraform
terraform init

To view terraform plan
terraform plan

To apply terraform plan
terraform apply
