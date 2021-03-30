# Kubernetes transformation macros
We have three macros defined in this directory, all used in the transformation phase of Stitch processing.

## `AddLabelsMacro` macro
[`AddLabelsMacro` macro](stitch-rules-add-labels.yaml) is used for adding the labels inside input documents. This macro is example of **using a macro inside another macro**.

Input parameter `labels` in the `AddLabelsMacro` is used as `entries` inputs for the used [`common:AddEntryToPath`](../../../common-macros/stitch-rules-add-entry.yaml) macro call. Other parameter for called `AddEntryToPath` macro is actually a fixed path to which we want to add given labels (`$..labels`).

Example for `labels` input parameter is:

```yaml
            "{\
              \"scope\": \"#{@environment.nameContains('prod') ? 'production' : 'unknown'}\",\
              \"environment\": \"#{@environment.name}\",\
              \"service\": \"k8s-stitch\"\
            }"
``` 
### Usages
In rule [AddLabels](../stitch-rules-add-label.yaml).

## `ReplicasSizeMacro` macro
[`ReplicasSizeMacro` macro](stitch-rules-replicas.yaml) is used for adjusting replicas size. This macro uses processor of type `common:PatchReplace` which overlays output of the patch replace operation on the `/spec/replicas` path.

Input parameter `replicasSize` (with default value of `1`)for the macro is used as `value` parameter for the `replace` patch operation. The parameter uses SpEL expression to fetch the passed input with the expression `#{#params['replicasSize']}`. Keep in mind that we could use variables which would map our parameters to the values that are then directly used in the `value` parameter. 
 
### Usages
In rule [JavaSvcResourcesProd](../stitch-rules-resources.yaml).

## `CpuMemoryLimitsMacro` macro
[`CpuMemoryLimitsMacro` macro](stitch-rules-resource-limit.yaml) is used for adjusting resource sizing. This macro uses the freemarker (see more about [Freemarker](https://freemarker.apache.org/)) processor which uses `jsonpath` to overwrite the entries under the JSON path `$.spec.template.spec.containers[0]` (see more about [JSON path](https://goessner.net/articles/JsonPath/index.html)).

[Freemarker template](templates/cpu-mem-limit.ftl) used for this macro contains the structure of `resources` object used for container configuration. Inside the template you can see example of template parameter passing from the macro. Parameters are accessed by using context variable `params` and using mustache notation e.g. `${params.cpuNumber}`. 

### Usages
In rule [JavaSvcResourcesProd](../stitch-rules-resources.yaml).
In rule [JavaSvcResourcesGuard](../stitch-rules-resources-guard.yaml).
