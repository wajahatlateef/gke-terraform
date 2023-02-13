variable "region" {
    default = "europe-west1"
  
}
variable "project_id" {
    default = "valued-listener-377008"
    type = string

}
variable "vpc-name" {
    default = "gke-vpc"
    type = string
}

variable "subnet-name" {
    default = "gke-subnet"
    type = string
}
variable "nodepool_name" {
    default = "gke-nodepool"
    type = string
  
}
variable "namespace" {
    default  = "nginx"
    type = string
}
# variable "cluster-endpoint" {
  
# }
# variable "access-token" {
#   default = ""
# }
# variable "host" {
  
# }
# variable "client_certificate" {
  
# }
# variable "cluster_ca_certificate" {
  
# }
# variable "client_key" {
  
# }