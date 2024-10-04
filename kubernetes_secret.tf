resource "kubernetes_secret" "concourse_web" {
  metadata {
    name      = "concourse-web"
    namespace = kubernetes_namespace_v1.concourse.metadata[0].name
  }

  data = {
    host-key                = tls_private_key.concourse_host_key.private_key_pem
    local-users             = "test:test"
    session-signing-key     = tls_private_key.concourse_session_signing_key.private_key_pem
    vault-client-auth-param = format("role_id:%s,secret_id:%s", var.concourse_role_id, var.concourse_secret_id)
    worker-key-pub          = tls_private_key.concourse_worker_key.public_key_openssh
  }

  type = "Opaque"
}

resource "kubernetes_secret" "concourse_worker" {
  metadata {
    name      = "concourse-worker"
    namespace = kubernetes_namespace_v1.concourse.metadata[0].name
  }

  data = {
    host-key-pub   = tls_private_key.concourse_host_key.public_key_openssh
    worker-key     = tls_private_key.concourse_worker_key.private_key_pem
    worker-key-pub = tls_private_key.concourse_worker_key.public_key_openssh
  }

  type = "Opaque"
}