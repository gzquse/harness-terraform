data "harness_application" "app"{
  name = "Pegasus"
  is_manual_trigger_authorized = false
  description                  = "Create Pegasus app"
}

resource "harness_environment" "dev" {
  app_id = data.harness_application.app.id
  name   = var.harness_env_name
  type   = var.cloud == "mccprod" ? "PROD" : "NON_PROD"

  variable_override {
    name  = "DEPLOY_CLUSTER"
    value = var.cluster_name
    type  = "TEXT"
  }

  variable_override {
    name  = "DEPLOY_ENV"
    value = var.harness_env_name
    type  = "TEXT"
  }

  variable_override {
    name  = "Harness_Delegate"
    value = var.delegate_name
    type  = "TEXT"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "harness_infrastructure_definition" "k8s_dev" {
  name                = "k8s-dev"
  app_id              = harness_application.peg.id
  env_id              = harness_environment.dev.id
  cloud_provider_type = "KUBERNETES_CLUSTER"
  deployment_type     = "KUBERNETES"

  kubernetes {
    cloud_provider_name = harness_cloudprovider_kubernetes.pegasus_k8s.name
    namespace           = harness_environment.dev.name
    release_name        = "$${service.name}"
  }

}

