# Import using the Harness application id

# Importing a global config only using the yaml path
#terraform import harness_yaml_config.Helm-Repo-Regasus-S3 "Setup/Cloud Providers/kubernetes.yaml"
# Importing a service which requires both the application id and the yaml path.
#terraform import harness_yaml_config.k8s_cloudprovider "Setup/Applications/MyApp/Services/MyService/Index.yaml:<APPLICATION_ID>"
# Import using the Harness aws cloud provider id.

export TF_VAR_github_token=bb6d6f06f18792ab56d7e070c81cb02788d13513
export TF_VAR_github_username=ziqguo
terraform import harness_encrypted_text.aws_secret_key -fSM3XR5QvG5ZYTvFf-tKQ
terraform import harness_encrypted_text.github_token 6dnUsCohQ8qZ8DRLfz6YIA
terraform import harness_encrypted_text.aws_access_key 8dVhhqd8Q1iyZpx5EnXEmg
terraform import harness_application.peg twwqiq5AS3qN4OjyGYLNug
terraform import harness_git_connector.sipedge HvKCOpt8S-yFsi-rnEUQnA
terraform import harness_git_connector.ziqguo 4GZ-jI77TMGguAAg6Vue0w
terraform import harness_encrypted_text.wbx3-aws_access_key aMAyBCcMRIKSh89zN0iu5Q