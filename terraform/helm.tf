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
    name  = "serviceAccount.name"
    value = "karpenter"
  }

  set {
    name  = "clusterName"
    value = "local-cluster"
  }

  set {
    name  = "clusterEndpoint"
    value = kubernetes_cluster.kubernetes.endpoint
  }

  set {
    name  = "defaultProvisioner"
    value = "true"
  }
}
