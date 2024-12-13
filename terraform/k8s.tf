# Create the namespace
resource "kubectl_manifest" "joke_fetcher" {
  yaml_body = file("${path.module}/../config/k8s_namespace.yaml")
}

# Apply the deployment configuration
resource "kubectl_manifest" "joke_fetcher_deployment" {
  yaml_body = file("${path.module}/../config/k8s_deployment.yaml")
}

# Apply the dervice configuration
resource "kubectl_manifest" "joke_fetcher_service" {
  yaml_body = file("${path.module}/../config/k8s_service.yaml")

  depends_on = [kubectl_manifest.joke_fetcher]
}
