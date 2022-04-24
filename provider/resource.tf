#resource "harness_application" "app" {
#  name        = "SandboxSipEdge"
#  description = "Sandbox for SipEdge testing purpose"
#}

resource "harness_git_connector" "sipedge" {
  name                 = "sqbu-github SandboxSipEdge Application"
  url                  = "https://sqbu-github.cisco.com/SIPEdge/harness-SandboxSipEdge.git"
  branch               = "master"
  generate_webhook_url = true
  password_secret_id   = "yqYZ5MFHRY-K7JrlOVv-9g"
  url_type             = "REPO"
  username             = "wbx3-harness.gen"
}