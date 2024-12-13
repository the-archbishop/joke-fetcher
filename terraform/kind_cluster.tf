resource "kind_cluster" "karpenter_test" {
  name = "karpenter-test"

  nodes {
    role = "control-plane"
  }

  nodes {
    role = "worker"
  }

  nodes {
    role = "worker"
  }
}
