resource "harness_application" "peg" {
  name                         = var.application_name
  is_manual_trigger_authorized = false
  description                  = "Create Pegasus app"
}

resource "harness_application" "app" {
  for_each = toset(var.application_list)

  name                         = each.key
  is_manual_trigger_authorized = false
  description                  = "Create Pegasus app"
}