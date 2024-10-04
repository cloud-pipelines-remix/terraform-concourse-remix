resource "kubernetes_namespace_v1" "concourse" {
  metadata {
    annotations = {
      name = "concourse"
    }

    name = "concourse"
  }
}