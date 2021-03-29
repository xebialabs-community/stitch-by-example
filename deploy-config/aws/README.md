# AWS CIs
[`bootstrap.yaml`](bootstrap.yaml) will create AWS related CIs needed for executing stitch rules defined [here](../../rules/aws/README.md)

## Application CIs
[Application yaml](applications/aws-apps.yaml) will create `aws.cloudformation.Template` CI defined with [artifacts/aws-cloud-formation.template](applications/artifacts/aws-cloud-formation.template)
## Environment CIs
[Environment yaml](environments/aws.yaml) will create a dictionary and environment.

All needed values have to be added to the `secrets.xlvals`, example of secrets file can be found [here](environments/secrets.xlvals.example)
## Infrastructure CIs

[Infrastructure yaml](infrastructure/aws-server.yaml) will create a `aws.Cloud` CI.

All needed values have to be added to the `secrets.xlvals`, example of secrets file can be found [here](infrastructure/secrets.xlvals.example)
