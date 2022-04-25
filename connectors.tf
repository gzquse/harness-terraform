data "harness_secret_manager" "default" {
  default = true
}

resource "harness_encrypted_text" "github_token" {
  name              = "${var.prefix}-github-token"
  value             = var.github_token
  secret_manager_id = data.harness_secret_manager.default.id

  usage_scope {
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }
}

resource "harness_git_connector" "ziqguo" {
  name                 = "${var.prefix}-git-connector"
  url                  = var.repository_url
  branch               = var.repository_branch
  username             = var.github_username
  password_secret_id   = harness_encrypted_text.github_token.id
  url_type             = "REPO"
  generate_webhook_url = true
}

#data "harness_secret_manager" "secret_manager" {
#  name = "keeper-wbxd-harness-sandbox"
#}
#
#output "harness_secret_manager" {
#  description = "keeper-wbxd-harness-sandbox"
#  value       = data.harness_secret_manager.secret_manager.name
#}
#resource "harness_yaml_config" "Helm-Repo-Regasus-S3" {
#  path    = "Setup/Artifact Servers/Helm Repo Pegasus - S3.yaml"
#  content = <<EOF
#
#  harnessApiVersion: '1.0'
#  type: AMAZON_S3_HELM_REPO
#  bucket: helm-central
#  cloudProvider: Amazon Web Services - jenkins-idsvc-gen
#  region: us-east-1
#
#EOF
#}
