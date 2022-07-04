locals {
  default_app = "Webex"
  variables = [
    {
      name  = "CDP_REGION"
      value = "override"
      type  = "TEXT"
    },
    {
      name  = "DEPLOY_CLUSTER"
      value = var.cluster_name
      type  = "TEXT"
    },
    {
      name  = "DEPLOY_ENV"
      value = var.harness_env_name
      type  = "TEXT"
    },
    {
      name  = "Harness_Delegate"
      value = var.delegate_name
      type  = "TEXT"
    }
  ]
}

data "harness_application" "env_app" {
  name                         = "Pegasus"
  is_manual_trigger_authorized = false
  description                  = "Create Pegasus app"
}

data "harness_application" "application" {
  for_each = toset(var.application_list)
  name     = each.key
}

resource "harness_environment" "env" {
  for_each = data.harness_application.application

  app_id = each.value.id
  name   = var.harness_env_name
  type   = var.cloud == "mccprod" ? "PROD" : "NON_PROD"

  dynamic "variable_override" {
    for_each = each.value.name == local.default_app ? local.variables : []
    content {
      name  = variable_override.value["name"]
      value = variable_override.value["value"]
      type  = variable_override.value["type"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "harness_infrastructure_definition" "infra" {
  for_each = harness_environment.env

  name                = var.harness_infra_name
  app_id              = each.value.app_id
  env_id              = each.value.id
  cloud_provider_type = "KUBERNETES_CLUSTER"
  deployment_type     = "HELM"

  kubernetes {
    cloud_provider_name = harness_cloudprovider_kubernetes.cloud_provider.name
    namespace           = "$${serviceVariable.Namespace}"
    release_name        = "$${infra.kubernetes.infraId}"
  }
}

