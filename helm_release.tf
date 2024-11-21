resource "helm_release" "concourse" {
  depends_on       = [kubernetes_secret.concourse_web, kubernetes_secret.concourse_worker]
  name             = "concourse"
  repository       = "https://concourse-charts.storage.googleapis.com/"
  chart            = "concourse"
  namespace        = "concourse"
  create_namespace = false
  version          = "v17.3.1"

  set {
    name  = "concourse.web.auth.github.enabled"
    value = false
  }
  set {
    name  = "concourse.web.auth.mainTeam.github.user"
    value = var.concourse_github_user
  }
  set {
    name  = "concourse.web.clusterName"
    value = var.concourse_clustername
  }
  set {
    name  = "concourse.web.enableRedactSecrets"
    value = true
  }
  set {
    name  = "concourse.web.enableAcrossStep"
    value = true
  }
  set {
    name  = "concourse.web.externalUrl"
    value = var.concourse_external_url
  }
  set {
    name  = "concourse.web.jobSchedulingMaxInFlight"
    value = 1
  }
  set {
    name  = "concourse.web.localAuth.enabled"
    value = true
  }
  set {
    name  = "concourse.web.kubernetes.enabled"
    value = false
  }
  set {
    name  = "concourse.web.vault.enabled"
    value = true
  }
  set {
    name  = "concourse.web.vault.url"
    value = var.vault_address
  }
  set {
    name  = "concourse.web.vault.authBackend"
    value = "approle"
  }
  set {
    name  = "concourse.web.vault.useAuthParam"
    value = "true"
  }
  set {
    name  = "concourse.worker.baggageclaim.driver"
    value = "overlay"
  }
  set {
    name  = "concourse.worker.runtime"
    value = "houdini"
  }
  set {
    name  = "secrets.create"
    value = "false"
  }
}
