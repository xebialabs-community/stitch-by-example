# Kubernetes transformation rules
This directory contains macros and rules used for the Stitch transformations on the kubernetes `k8s.Resources` deployment. Macros are placed in sub-directory `macros` and description can be found in this [README.md](macros/README.md).

## `AddLabels` rule
### Rule definition
[Rule](stitch-rules-add-label.yaml) is applied for the `k8s.Resources` deployment.

### Processors
Rule has one Stitch Macro processor of type `k8s:AddLabelsMacro` which adds labels to the input document.

Passed in `labels` parameter used inside called macro has set of key/value pairs. Value part of the pair is either a SpEL expression, or a fixed value. SpEL expressions used in passed in `labels` object have to use `#{}` curlies, annotating that inside of curlies SpEL expression has to be evaluated.

Processor is applied in `PATCH` phase of the Stitch transformation.

## `JavaSvcResourcesProd` rule
### Rule definition
[Rule](stitch-rules-resources.yaml) is applied for the `k8s.Resources` deployment, which have `kind` of `Deployment`.

### Processors
Rule has two Stitch Macro processors. 

First one will call `k8s:ReplicasSizeMacro` (see [macro README.md](macros/README.md)) . It takes `replicasSize` as parameter which is provided from the dictionary value using SpEL expression `#{@dictionary.getValue('replicasSize')}`.


Second processor will call `k8s:CpuMemoryLimitsMacro` (see [macro README.md](macros/README.md)). Processor sends two parameters (`cpuNumber` and `memorySize`) for both of which values are provided using SpEL expression for fetching values from deployment dictionary.

Both processors are applied in `PATCH` phase of the Stitch transformation.

## `JavaSvcResourcesGuard` rule
### Rule definition
[Rule](stitch-rules-resources-guard.yaml) is applied for the `k8s.Resources` deployment, which have `kind` of `Deployment` and are deployed on the environment which name contains `test` string.

### Processors
Rule has one Stitch Macro processors of type `k8s:CpuMemoryLimitsMacro` (see [macro README.md](macros/README.md)) . Processor sends two parameters (`cpuNumber` and `memorySize`) for both of which values are hardcoded in rule.

Processor is applied in `POST_FLIGHT` phase of the Stitch transformation, which will ensure this rule is executed as one of the last ones.

## `DeploymentPortsGuard` rule
### Rule definition
[Rule](stitch-rules-deployment-ports-guard.yaml) is applied for the `k8s.Resources` deployment, which have `kind` of `Deployment` and are deployed on the environment which name contains `prod` string.

### Processors
Rule has one processor of type `common:PatchReplace` which uses JSON Patch to replace current value on path `/spec/template/spec/containers/0/ports/0/containerPort` with a value provided in the deployment dictionary by using SpEL expression `#{@dictionary.getValue('portNumber')}`.

Processor is applied in `POST_FLIGHT` phase of the Stitch transformation, which will ensure this rule is executed as one of the last ones.

## `ServicePortsGuard` rule
### Rule definition
[Rule](stitch-rules-service-ports-guard.yaml) is applied for the `k8s.Resources` deployment, which have `kind` of `Service` and are deployed on the environment which name contains `prod` string.

### Processors
Rule has three processors which uses macro of type `common:PatchReplace` to replace current value on given paths.

Processor is applied in `POST_FLIGHT` phase of the Stitch transformation, which will ensure this rule is executed as one of the last ones.
