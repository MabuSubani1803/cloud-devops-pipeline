provider "google" {
  project = "my-practice-project-443208"
  region  = "us-central1"
}

resource "google_container_cluster" "primary" {
  name     = "sample-node-app-cluster"
  location = "us-central1"
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"
  }
}
