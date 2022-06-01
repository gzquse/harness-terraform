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