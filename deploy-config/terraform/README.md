# AWS CIs
[`bootstrap.yaml`](bootstrap.yaml) will create Terraform related CIs needed for executing stitch rules defined [here](../../rules/terraform/README.md)

## Application CIs
[Application yaml](applications/tf-apps.yaml) will create three `terraform.Module` CIs.
They are defined by given artifacts in this [directory](applications/artifacts).
Difference between them is on usage of deployment target (k8s or aws) and the difference in the input format (json or hcl).

## Environment CIs
[Environment yaml](environments/terraform.yaml) will create Terraform environment.

## Infrastructure CIs

[Infrastructure yaml](infrastructure/tf-server.yaml) will create a `terraform.TerraformClient` CI on the `overthere.LocalHost`.

All needed values have to be added to the `secrets.xlvals`, example of secrets file can be found [here](infrastructure/secrets.xlvals.example)
