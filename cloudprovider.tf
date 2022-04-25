// AWS
resource "harness_encrypted_text" "aws_access_key" {
  name              = "aws_access_key"
  value             = "AKIASGYP6GSQIYMERLNU"
  secret_manager_id = data.harness_secret_manager.default.id
}

#resource "harness_encrypted_text" "aws_secret_key" {
#  name              = "aws_secret_key"
#  value             = "unknown"
#  secret_manager_id = data.harness_secret_manager.default.id
#}

#data "harness_encrypted_text" "aws_secret_key"{
#  name = "aws_secret_key"
#}

#output "aws_secret_key" {
#  value = harness_encrypted_text.aws_access_key.value
#}

#resource "harness_encrypted_text" "aws_secret_key" {
#  # (resource arguments)
#}


#resource "harness_encrypted_text" "aws_access_key_jenkins" {
#  name              = "aws_access_key_jenkins"
#  value             = "someval"
#  secret_manager_id = data.harness_secret_manager.default.id
#}


#resource "harness_cloudprovider_aws" "aws" {
#  name                          = "Amazon Web Services - jenkins-idsvc-gen"
#  access_key_id_secret_name     = harness_encrypted_text.aws_access_key.name
#  secret_access_key_secret_name = harness_encrypted_text.aws_secret_key.name
#}

resource "harness_cloudprovider_kubernetes" "k8s" {
  name = "${var.prefix}-kubernetes"

  authentication {
    delegate_selectors = ["primary"]

  }

  usage_scope {
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }

  lifecycle {
    create_before_destroy = true
  }
}