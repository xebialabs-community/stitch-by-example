# Terraform Stitch rules 
Subset of Stitch rules for Terraform deployments gives examples of stitch capabilities.
Stitch for Terraform supports both JSON and HCL as inputs.

In these examples we cover rules with conditions based on `deployedType` and `expression`. 
The `expression` uses both `ctx` (i.e. `DeploymentContext`) and `input` (i.e. `InputContext`) values for conditions.
Freemarker processors are used. One of the processors shows how to pass in a variable value and use it inside freemarker template.

## `ChangeNamespaceName` rule
### Rule definition
[Rule](stitch-rules-change-namespace.yaml) is applied for the `terraform.ExecutedModule` deployment. Which also has an existing and non-empty `$.resource.kubernetes_namespace` path defined in the document. We achieve that by checking the `#input.pathExistsWithValue('$.resource.kubernetes_namespace')` flag.

### Processors
Rule has one Freemarker processor with inline template definition. Freemarker processor uses JSON path merge type on path `$.resource.kubernetes_namespace.[*].metadata`.

Template uses the variable by using the Freemarker mustache expressions `${namespace}`. The value for the `namespace` is passed in using the `variables` field.

Example also shows how we can retrieve this value dynamically using the SpEL expressions. In this case we are retrieving deployed application name by this expression `#{@deployedApplication.name}`.

Processor is applied in `PATCH` phase.

## `ChangeVPCName-HCL` rule
### Rule definition
[Rule](stitch-rules-change-vpc-hcl.yaml) is applied for the `terraform.ExecutedModule` deployment. Which also has an existing and non-empty `$.resource.aws_vpc.terraform_vpc[0]` path defined in the document. We achieve that by checking the `#input.pathExistsWithValue('$.resource.aws_vpc.terraform_vpc[0]')` flag. Additionally, in order to apply these rule processors we are checking for correct deployed application name, we are expecting it to be equal `terraform-aws-hcl`. This means that we expect HCL input for this rule - which is transparent for the user, because HCL to JSON conversion will be applied automatically, and no interaction by user is needed here.

### Processors
Rule has one Freemarker processor with inline template definition. Freemarker processor uses JSON path merge type on path `$.resource.aws_vpc.terraform_vpc[0].tags`.

## `ChangeVPCName-JSON` rule
### Rule definition
[Rule](stitch-rules-change-vpc-json.yaml) is applied for the `terraform.ExecutedModule` deployment. Which also has an existing and non-empty `$.resource.aws_vpc.terraform_vpc` path defined in the document. We achieve that by checking the `#input.pathExistsWithValue('$$.resource.aws_vpc.terraform_vpc')` flag. Additionally, in order to apply these rule processors we are checking for correct deployed application name, we are expecting it to be equal `terraform-aws-json`.

### Processors
Rule has one Freemarker processor with inline template definition. Freemarker processor uses JSON path merge type on path `$.resource.aws_vpc.terraform_vpc.tags`.
