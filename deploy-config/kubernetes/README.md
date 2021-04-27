# AWS CIs
[`bootstrap.yaml`](bootstrap.yaml) will create Kubernetes related CIs needed for executing stitch rules defined [here](../../rules/k8s/README.md)

## Application CIs
[Application yaml](applications/k8s-apps.yaml) will create two `k8s.ResourcesFile` CIs.

One is standard kubernetes PetClinic Spring Boot application defined with [artifacts/petclinic-service.yaml](applications/artifacts/petclinic-service.yaml)

Second one is has empty artifact (empty yaml file) [artifacts/empty.yaml](applications/artifacts/empty.yaml)
## Environment CIs
[Environment yaml](environments/k8s.yaml) will create two Kubernetes environments. One will represent test and second one production instance.

Each of two environments also has a Dictionary defined. Values from the dictionary are used throughout the Stitch rules.

## Infrastructure CIs

[Infrastructure yaml](infrastructure/k8s-master.yaml) will create a `k8s.Master` CI with default namespace.

All needed values have to be added to the `secrets.xlvals`, example of secrets file can be found [here](infrastructure/secrets.xlvals.example)
