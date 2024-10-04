variable "kubernetes_config_path" {
  type    = string
  default = "~/.kube/config"
}

variable "kubernetes_config_context" {
  type    = string
  default = "kind-remix"
}

variable "concourse_github_user" {
  type    = string
  default = "dashaun"
}

variable "concourse_clustername" {
  type    = string
  default = "Spring Cloud Pipelines Remix"
}

variable "concourse_external_url" {
  type    = string
  default = "http://concourse.apps-127-0-0-1.nip.io/"
}

variable "vault_address" {
  type    = string
  default = "http://vault.vault.svc.cluster.local:8200"
}

variable "concourse_role_id" {
  type = string
}

variable "concourse_secret_id" {
  type = string
}