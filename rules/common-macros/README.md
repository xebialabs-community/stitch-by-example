# Common macros
This directory has a common macros definition.

## `AddEntryToPath` macro
[AddEntryToPath macro](stitch-rules-add-entries.yaml) is used for adding the given object to specified path.

To implement such macro we have used a Groovy processor (see [AddEntryPath.groovy](groovy/AddEntryToPath.groovy)). Implementation uses `com.xebialabs.deployit.plugin.stitch.service.engine.processor.handler.groovy.MapFunction` in order to add the key value pairs passed in as parameter `entries` to the specified path passed in as `path` parameter.  

Macro is used from Stitch rules or macros as follows:
```yaml
      - type: "common:AddEntryToPath"
        description: "Add entries to path"
        parameters:
          path: "$..path"
          entries: "{\
              \"key1\": \"value1\",\
              \"key2\": \"#{@environment.name}\"
            }"
```
### Usages of `AddEntryToPath`
In macro [AddLabelsMacro](../k8s/transformation/macros/stitch-rules-add-labels.yaml).

## `PatchReplace` macro
[PatchReplace macro](stitch-rules-replace-at-path.yaml) is used for replacing the given value on the specified path using the JSON Patch replace operation.

Parameters used in macro are `path` and `value`. Which should represent path to which the value will be applied.

Macro is used from Stitch rules or macros as follows:
```yaml
      - type: "common:PatchReplace"
        description: "This will replace /my/path value with new-value"
        phase: POST_FLIGHT
        parameters:
          path: "/my/path"
          value: "new-value"
```
### Usages of `PatchReplace`
In macro [ReplicasSizeMacro](../k8s/transformation/macros/stitch-rules-replicas.yaml).
In rule [ServicePortsGuard](../k8s/transformation/stitch-rules-service-ports-guard.yaml).
In rule [DeploymentPortsGuard](../k8s/transformation/stitch-rules-deployment-ports-guard.yaml).
In rule [UseLocationParameter](../azure/stitch-rules-use-location-param.yaml).
