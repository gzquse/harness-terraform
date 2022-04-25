resource "harness_application" "peg" {
  name                         = var.application_name
  is_manual_trigger_authorized = false
  description                  = "Create Pegasus app"
}

