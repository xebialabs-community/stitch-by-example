# AWS Stitch rules 
Subset of Stitch rules for AWS Cloudformation Template deployments gives simple examples of stitch capabilities.

In these examples we cover rules with simple conditions based on `deployedType` and processors that use Groovy, Freemarker and JSON Patch processors.

## `ChangeDescriptionAws` rule
### Rule definition
[Rule](stitch-rules-change-description.yaml) is applied for the `aws.cloudformation.DeployedTemplate` deployment.

### Processors
Rule has one Groovy processor with inline script definition. Groovy code simply overrides the `$.Description` path with the constant description string.

Processor is applied in `BASE_DEFINITION` phase, which will apply this processor at very beginning of Stitch transformation.

## `ChangeSSHSettings` rule
### Rule definition
[Rule](stitch-rules-ssh-security.yaml) is applied for the `aws.cloudformation.DeployedTemplate` deployment.

### Processors
Rule has two processors, one is Freemarker processor and second one is JSON Patch processor.

Freemarker processor adds inline defined template which will use `jsonpath` merge type to add it under the `$.Parameters` path. Template contains `SSHLocation` which we will reference using the next processor.

JSON Patch processor will replace existing value under path `/Resources/InstanceSecurityGroup/Properties/SecurityGroupIngress/0/CidrIp` with an object containing reference to above created `SSHLocation` definition.

Freemarker processor is applied in `GENERATE` phase, which will apply this processor before the JSON Patch processor which ise applied in `PATCH` phase.
