terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }
  }
}

provider "kubectl" {
  config_path = "~/.kube/config"
}

# Create the namespace
resource "kubectl_manifest" "joke_fetcher" {
  yaml_body = file("${path.module}/../k8s/namespace.yaml")
}

# Apply the Deployment YAML
resource "kubectl_manifest" "joke_fetcher_deployment" {
  yaml_body = file("${path.module}/../k8s/deployment.yaml")
}

# Apply the Service YAML
resource "kubectl_manifest" "joke_fetcher_service" {
  yaml_body = file("${path.module}/../k8s/service.yaml")

  depends_on = [kubectl_manifest.joke_fetcher]
}
