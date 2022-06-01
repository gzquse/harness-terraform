terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
    vault = {
      configuration_aliases = [vault.app_secrets_ns, vault.root_ns, vault.dev, vault.int, vault.prod]
      version               = ">=3.3.1"
    }
  }
}

provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = data.vault_generic_secret.harness.data["sandbox_account_id"]
  api_key    = data.vault_generic_secret.harness.data["api_key"]
}
