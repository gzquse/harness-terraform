resource "null_resource" "example1" {
  provisioner "local-exec" {
    command     = "open WFH, '>completed.txt' and print WFH scalar localtime"
    interpreter = ["perl", "-e"]
  }
}

resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "echo 'hello' >> private_ips.txt"
  }
}

variable "users" {
  type = map(object({
    is_admin = bool
    name     = string
  }))
  default = {
    users = {
      is_admin = false
      name     = "martin"
    }
    users2 = {
      is_admin = true
      name     = "jacks"
    }
  }
  validation {
    condition     = length(var.users.users.name) > 4
    error_message = "The User name length must over 4."
  }
}

locals {
  admin_users = {
  for name, user in var.users : name => user if user.is_admin
  }
  regular_users = {
  for name, user in var.users : name => user if !user.is_admin
  }
}

output "users" {
  value = local.admin_users
}

#terraform {
#  backend "s3" {
#    bucket                  = "tfstate-application-groups"
#    key                     = "terraform-state/hfedev-hfedev-pegasus02-harness-cloud-provider.tfstate"
#    region                  = "us-east-2"
#    max_retries             = 3
#    shared_credentials_file = "/etc/wbx3/onboarding/aws/credentials"
#  }
#}
