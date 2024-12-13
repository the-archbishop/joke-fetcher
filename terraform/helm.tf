resource "helm_release" "karpenter" {
  name       = "karpenter"
  namespace  = "karpenter"
  chart      = "karpenter"
  repository = "https://charts.karpenter.sh"
  version    = "v0.29.0"

  create_namespace = true

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "clusterName"
    value = "docker-desktop-cluster"
  }

  set {
    name  = "clusterEndpoint"
    value = "http://localhost:6443"  # Docker Desktop
  }

  set {
    name  = "defaultProvisioner"
    value = "true"
  }
}
