data "harness_secret_manager" "default" {
  default = true
}

data "harness_secret_manager" "vault" {
  name = "keeper-wbxd-harness-sandbox"
}
// AWS
resource "harness_encrypted_text" "aws_access_key" {
  name              = "aws_access_key"
  value             = "AKIASGYP6GSQIYMERLNU"
  secret_manager_id = data.harness_secret_manager.default.id
}

resource "harness_encrypted_text" "aws_access_key2" {
  name              = "aws_access_key2"
  value             = "AKIAXVZVVGMCCNYWWMMZ"
  secret_manager_id = data.harness_secret_manager.default.id
}

resource "harness_encrypted_text" "wbx3-aws_access_key" {
  name                               = "wbx3-aws-iam-secret-access-key"
  value                              = ""
  secret_manager_id                  = data.harness_secret_manager.vault.id
  inherit_scopes_from_secret_manager = true
}

resource "harness_encrypted_text" "aws_secret_key" {
  name              = "aws_secret_key"
  secret_manager_id = "6TLq_CboQ5CUtQyDev2yQg"
  value             = ""
}

resource "harness_cloudprovider_aws" "aws" {
  name                          = "WBX3 Account 527856644868 Access"
  access_key_id_secret_name     = harness_encrypted_text.aws_access_key2.name
  secret_access_key_secret_name = harness_encrypted_text.wbx3-aws_access_key.name
}

data "harness_delegate" "pegasus02" {
  name   = "hfedev-pegasus02"
  status = "ENABLED"
}