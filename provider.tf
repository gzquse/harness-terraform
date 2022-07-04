terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
    vault = {
      version = ">=3.3.1"
    }
    null = {
      version = "3.1.1"
    }
  }
}

provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = data.vault_generic_secret.harness.data["sandbox_account_id"]
  api_key    = data.vault_generic_secret.harness.data["api_key"]
}

provider "vault" {
  alias              = "root_ns"
  address            = "https://east.keeper.cisco.com"
  add_address_to_env = true
  namespace          = "meetpaas/hfedev"
  token              = "hvs.CAESIJOVtBy8yQOtMM5MPc_qcMdvjx4PuAxPam_hhSs2-fWOGiQKImh2cy56SUhGQ1Z1S2pzdXZXb2JpcHFkQXZSWFoudDM4amU"
}

data "vault_generic_secret" "harness" {
  path = "secret/hfedev/harness/harness-delegate"
}
