resource "kubectl_manifest" "karpenter_provisioner" {
  yaml_body = file("${path.module}/../config/karpenter_provisioner.yaml")
}
