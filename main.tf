resource "harness_encrypted_text" "aws_secret_key" {
  name              = "aws_secret_key"
  secret_manager_id = "6TLq_CboQ5CUtQyDev2yQg"
  value = ""

  usage_scope {
    application_id          = "UvK5M4S1QSeiV4zZGaRRaA"
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    application_id          = "UvK5M4S1QSeiV4zZGaRRaA"
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }
}