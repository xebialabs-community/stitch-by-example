# Common macros
This directory has a common macro definition (see [AddEntryToPath macro](stitch-rules-add-entry.yaml)) used for adding the given object to specified path.

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
## Usages
In macro [AddLabelsMacro](../k8s/transfromation/macros/stitch-rules-add-labels.yaml).
