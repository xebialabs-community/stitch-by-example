# Azure Stitch rules 
Subset of Stitch rules for Azure Template deployments gives examples of stitch capabilities.

In these examples we cover rules which use macros and external templates.

## `UseLocationParameter` rule
### Rule definition
[Rule](stitch-rules-use-location-param.yaml) is applied for the `azure.arm.DeployedTemplate` deployment.

### Processors
Rule has two processors, one is Freemarker processor and second one is using `PatchReplace` macro.

Freemarker processor uses external template file to overlay given json to the original document.

Macro processor will replace existing value under path `/resources/0/location` with a value of `[parameters('location')]`.
Notice the passed in parameters to the macro are `path` and `value` which are then used inside of `PatchReplace` macro using the `#{#params['variable_name']}}` expression.

Freemarker processor is applied in `BASE_DEFINITION` phase, which will apply this processor before the macro processor which ise applied in `PATCH` phase.
