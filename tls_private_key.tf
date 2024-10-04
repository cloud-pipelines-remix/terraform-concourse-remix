resource "tls_private_key" "concourse_host_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "concourse_worker_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "concourse_session_signing_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}