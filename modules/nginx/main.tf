
provider "kubernetes" {
  config_path    = "/Users/wajahatlateef/.kube/config"
 # config_context = "my-context"
}


# resource "kubernetes_namespace" "nginx" {
#   metadata {
#     name = "nginx"
#   }
# }
# resource "google_compute_address" "default" {
#   name   = "${var.namespace}"
#   region = "${var.region}"
# }


# resource "kubernetes_service" "nginx" {
#   metadata {
#     namespace = "${var.namespace}"
#     name      = "nginx-deployment"
#   }

#   spec {
#     selector = {
#       run = "nginx-deployment"
#     }

#     port {
#       protocol    = "TCP"
#       port        = 80
#       target_port = 80
#     }

#     type             = "LoadBalancer"
#     load_balancer_ip = google_compute_address.default.address
#   }
# }
