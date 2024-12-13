resource "kubectl_manifest" "karpenter" {
  yaml_body = file("${path.module}/../config/karpenter_namespace.yaml")
}

resource "kubectl_manifest" "karpenter_provisioner" {
  yaml_body = file("${path.module}/../config/karpenter_provisioner.yaml")
}

resource "kubectl_manifest" "karpenter_service_account" {
  yaml_body = file("${path.module}/../config/karpenter_service_account.yaml")
}

resource "kubectl_manifest" "karpenter_deployment" {
  yaml_body = file("${path.module}/../config/karpenter_deployment.yaml")

  depends_on = [kubectl_manifest.karpenter_service_account]
}
