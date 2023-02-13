provider "google" {
    credentials = file("/var/lib/jenkins/templates/cert.json")
    project = var.project_id
    region  = var.region
}

module "vpc" {
   source = "./modules/vpc"
   vpc-name = var.vpc-name
   region = var.region
   project_id = var.project_id 
   subnet-name = var.subnet-name
}


module "gke" {
    source = "./modules/gke"
    region  = var.region
    vpc-name = var.vpc-name
    subnet-name = var.subnet-name
    nodepool_name = var.nodepool_name
    depends_on = [
      module.vpc
    ]

}
# cluster-endpoint = module.gke.cluster-endpoint
# access-token = module.gke.access-token
# host = module.gke.host
# cluster_ca_certificate = module.gke.cluster_ca_certificate
# client_key = module.gke.client_key
# client_certificate = module.gke.client_certificate

# provider "kubernetes" {
#   version = "2.17.0"
#   host    = "${module.gke.cluster-endpoint}"
#   token   = "${module.gke.access-token}"
#   client_certificate = base64decode(
#    "${module.gke.client_certificate}",
#   )
#   client_key = base64decode("${module.gke.client_key}",)
#   cluster_ca_certificate = base64decode(
#     "${module.gke.cluster_ca_certificate}",
#   )
# }



module "nginx"{
    source = "./modules/nginx"
    namespace = var.namespace
    region = var.region
    # cluster-endpoint = "${module.gke.cluster-endpoint}"
    # access-token = "${module.gke.access-token}"
    # host = "${module.gke.host}"
    # cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
    # client_key = "${module.gke.client_key}"
    # client_certificate ="${module.gke.client_certificate}"
    

}
