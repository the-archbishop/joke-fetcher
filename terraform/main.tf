provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Apply the Deployment YAML file
resource "kubernetes_manifest" "joke_fetcher_deployment" {
  manifest = yamldecode(file("${path.module}/../k8s/deployment.yaml"))
}

# Apply the Service YAML file
resource "kubernetes_manifest" "joke_fetcher_service" {
  manifest = yamldecode(file("${path.module}/../k8s/service.yaml"))
}
