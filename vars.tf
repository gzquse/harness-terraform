variable "github_username" {
  description = "The github username used for the git connector."
}

variable "github_token" {
  description = "The github token for used for the git connector."
}

variable "application_name" {
  description = "The name of the Harness application to be created."
  default     = "Pegasus"
}

variable "application_list" {
  description = "A series of harness application name"
  default     = ["Webex", "WebexSipEdge"]
  type        = list(string)
}

variable "cloud_provider_prefix" {
  description = "A prefix to use to ensure account level settings are unique (i.e. cloud providers, secrets, connectors, etc.)."
  default     = "Kubed"
  type        = string
}

variable "prefix" {
  description = "A prefix to use to ensure account level settings are unique (i.e. cloud providers, secrets, connectors, etc.)."
  default     = "Kubed"
}

variable "repository_url" {
  description = "The url of the repository to be cloned."
  default     = "https://sqbu-github.cisco.com/ziqguo/terraform-provider.git"
}

variable "repository_branch" {
  description = "The branch of the repository to use for the git connector."
  default     = "master"
}

variable "harness_env_name" {
  description = "Harness environment name"
  default = "WBX3-int301"
}

variable "harness_infra_name" {
  description = "Harness infrastructure name"
  default = "int301"
}

variable "cnc_name" {
  description = "Comand and control name"
  default = "hfedev"
}

variable "delegate_name" {
  description = "Harness delegate name"
  default = "hfedev-pegasus02"
}

variable "cloud" {
  description = "Name of the Command and Control Panel"
  default = "hfedev"
}

output "api_base_url" {
  value = "https://asd:8433/"
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  default = "int-third"
}