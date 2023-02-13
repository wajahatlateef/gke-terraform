
resource "google_service_account" "default" {
  account_id   = "valued-listener-377008"
  display_name = "Service Account"
}

data "google_client_config" "current" {
}

resource "google_container_cluster" "primary" {
  name = "valued-listener-377008-cluster"
  location      = "${var.region}"
  remove_default_node_pool = true
  initial_node_count       = 1
  network    = "${var.vpc-name}"
  subnetwork = "${var.subnet-name}"
}

resource "google_container_node_pool" "gke-nodepool" {
  name       = "${google_container_cluster.primary.name}-nodes"
  location   = "${var.region}"
  #cluster    = "/v1beta1/projects/valued-listener-377008/locations/europe-west1/clusters/valued-listener-377008-cluster"
  cluster = google_container_cluster.primary.id
  node_count = 1
  #service_account = google_service_account.default.email
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "valued-listener-377008"
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "valued-listener-377008-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}


# resource "kubernetes_cluster_role" "terraform" {
#   metadata {
#     name = "terraform-role"
#   }

#   rule {
#     api_groups = [""]
#     resources  = ["namespaces", "pods", ""]
#     verbs      = ["create", "get", "list", "watch"]
#   }
# }

# resource "kubernetes_cluster_role_binding" "example" {
#   metadata {
#     name = "terraform-roledinding"
#   }
#   role_ref {
#     api_group = "rbac.authorization.k8s.io"
#     kind      = "ClusterRole"
#     name      = "wajahatlatef@gmail.com"
#   }
#   subject {
#     kind      = "User"
#     name      = "wajahatlatef@gmail.com"
#     api_group = "rbac.authorization.k8s.io"
#   }
#   subject {
#     kind      = "User"
#     name      = "wajahatlatef@gmail.com"
#     namespace = "kube-system"
#   }
#   subject {
#     kind      = "Group"
#     name      = "system:masters"
#     api_group = "rbac.authorization.k8s.io"
#   }
# }
