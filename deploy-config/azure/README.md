# AWS CIs
[`bootstrap.yaml`](bootstrap.yaml) will create Azure related CIs needed for executing stitch rules defined [here](../../rules/azure/README.md)

## Application CIs
[Application yaml](applications/azure-apps.yaml) will create `azure.arm.Template` CI defined with [artifacts/armTemplate.json](applications/artifacts/armTemplate.json)
## Environment CIs
[Environment yaml](environments/azure.yaml) will create Azure environment.

## Infrastructure CIs

[Infrastructure yaml](infrastructure/azure-server.yaml) will create a `azure.Cloud` CI.

All needed values have to be added to the `secrets.xlvals`, example of secrets file can be found [here](infrastructure/secrets.xlvals.example)
