provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Create the namespace
resource "kubernetes_namespace" "joke_fetcher" {
  metadata {
    name = "joke-fetcher"
  }
}

# Apply the Deployment YAML
resource "kubernetes_manifest" "joke_fetcher_deployment" {
  manifest = yamldecode(file("${path.module}/../k8s/deployment.yaml"))

  depends_on = [kubernetes_namespace.joke_fetcher]
}

# Apply the Service YAML
resource "kubernetes_manifest" "joke_fetcher_service" {
  manifest = yamldecode(file("${path.module}/../k8s/service.yaml"))

  depends_on = [kubernetes_namespace.joke_fetcher]
}
