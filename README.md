# Stitch by Example Repository
This repository consists of simple and advanced Stitch Rules and Macros examples that can be used for learning or demoing of [Digital.ai Deploy Stitch module](https://docs.xebialabs.com/deploy/stitch) capabilities.

In order to use provided Stitch rules from this repository it is best to run the XL CLI script provided in this repository because rules are using specific Environment or Application names.

## Pre-requisites
Running newest version of [Digital.ai Deploy](https://docs.xebialabs.com/deploy). With the plugins:
* xld-kubernetes-plugin,
* xld-aws-plugin,
* xld-terraform-plugin,
* xld-azure-plugin.

**Note:** If you don't want to use some of the plugins alter the [bootstrap script](/deploy-config/demo-bootstrap.yaml) and comment them out.

Installed [XL CLI](https://docs.xebialabs.com/deploy/devops-as-code).

## Checkout this repository
```
git clone git@github.com:xebialabs-community/stitch-by-example
```

## Bootstrap the Configuration
Run your XL CLI in root directory of checked out project:
```
xl apply -f deploy-config/demo-bootstrap.yaml 
```
**Note:** Do not forget to adjust your `secret.xlvals` files to configure your infrastructure correctly.

This will fill in your CIs into the Deploy together with the Stitch Source pointing to this GitHub repository. Stitch rules and macros will be loaded in the system automatically, and you are ready to use the system and try it out.

## Feature and capabilities overview
This repository and containing Stitch Rules and Macros give a wide overview of simple to more advanced features of Stitch. They cover all of supported plugins examples*, as well as many features that are supported.

_*_ _except OpenShift plugin which is quite similar to Kubernetes examples_

Here is a short cross-reference on the Rules and Macros:
* [`AddEntryToPath`](rules/common-macros/stitch-rules-add-entries.yaml) - [Common macro which adds a Map to the defined path using Groovy script](rules/common-macros/README.md#addentrytopath-macro) 
  
* [`PatchReplace`](rules/common-macros/stitch-rules-replace-at-path.yaml) - [Common macro which adds uses JSON Patch to replace given path with a value](rules/common-macros/README.md#patchreplace-macro)
  
* [`ChangeDescriptionAws`](rules/aws/stitch-rules-change-description.yaml) - [AWS rule with simple Groovy processor](rules/aws/README.md#changedescriptionaws-rule)
  
* [`ChangeSSHSettings`](rules/aws/stitch-rules-ssh-security.yaml) - [AWS rule with simple Freemarker and JSON Patch processor](rules/aws/README.md#changesshsettings-rule)
  
* [`UseLocationParameter`](rules/azure/stitch-rules-use-location-param.yaml) - [Azure rule with simple usage of Macro and external Freemarker template definition](rules/azure/README.md#uselocationparameter-rule)
  
* [`ChangeVPCName-JSON`](rules/terraform/stitch-rules-change-vpc-json.yaml) - [Terraform rule with simple freemarker processor and example of `expressions` by document fields and deployed application name](rules/terraform/README.md#changevpcname-json-rule)
  
* [`ChangeVPCName-HCL`](rules/terraform/stitch-rules-change-vpc-hcl.yaml) - [Terraform rule with simple freemarker processor and example of `expressions` by document fields and deployed application name](rules/terraform/README.md#changevpcname-hcl-rule)
  
* [`ChangeNamespaceName`](rules/terraform/stitch-rules-change-namespace.yaml) - [Terraform rule with freemarker processor with variables and example of `expressions` by document fields](rules/terraform/README.md#changenamespacename-rule)
  
* [`AddLabelsMacro`](rules/k8s/transformation/macros/stitch-rules-add-labels.yaml) - [Kubernetes related macro for adding labels - usage of macro inside of macro with passed in parameter](rules/k8s/transformation/macros/README.md#addlabelsmacro-macro)
  
* [`ReplicasSizeMacro`](rules/k8s/transformation/macros/stitch-rules-replicas.yaml) - [Kubernetes related macro for changing replicas size - usage of macro inside of macro with passed in parameters](rules/k8s/transformation/macros/README.md#replicassizemacro-macro)
  
* [`CpuMemoryLimitsMacro`](rules/k8s/transformation/macros/stitch-rules-resource-limit.yaml) - [Kubernetes related macro for adding resource using external Freemarker template with passed in parameters](rules/k8s/transformation/macros/README.md#cpumemorylimitsmacro-macro)

* [`AddLabels`](rules/k8s/transformation/stitch-rules-add-label.yaml) - [Kubernetes rule for adding multiple labels using a macro and passing in a JSON object as parameter](rules/k8s/transformation/README.md#addlabels-rule)

* [`DeploymentPortsGuard`](rules/k8s/transformation/stitch-rules-deployment-ports-guard.yaml) - [Kubernetes rule for changing a path value using a macro](rules/k8s/transformation/README.md#deploymentportsguard-rule)

* [`JavaSvcResourcesProd`](rules/k8s/transformation/stitch-rules-resources.yaml) - [Kubernetes rule with multiple processors for changing a path value using different macros](rules/k8s/transformation/README.md#javasvcresourcesprod-rule)

* [`JavaSvcResourcesGuard`](rules/k8s/transformation/stitch-rules-resources-guard.yaml) - [Kubernetes rule with multiple processors for changing a path value using different macros](rules/k8s/transformation/README.md#javasvcresourcesguard-rule)

* [`ServicePortsGuard`](rules/k8s/transformation/stitch-rules-service-ports-guard.yaml) - [Kubernetes rule with multiple processors for changing a path value using different macros](rules/k8s/transformation/README.md#serviceportsguard-rule)

* [`CreateK8SManifest`](rules/k8s/pre-transformation/stitch-rules.yaml) - [Kubernetes pre-processing rule for adding YAML documents in Pre-processing phase from YAML file templates](rules/k8s/pre-transformation/README.md#kubernetes-pre-processing-rules)

* [`CreateK8SIngress`](rules/k8s/post-transformation/stitch-rules.yaml) - [Kubernetes post-processing rule for adding documents in Post-processing phase from Freemarker template and passing in the variable to do dynamic swap of content](rules/k8s/post-transformation/README.md#kubernetes-post-processing-rules)

## References and documentation
* [Stitch documentation](https://docs.xebialabs.com/deploy/stitch)
* [Spring Expression Language - SpEL](https://docs.spring.io/spring-framework/docs/5.3.5/reference/html/core.html#expressions)
* [Freemarker](https://freemarker.apache.org/)
* [JSON Path](https://goessner.net/articles/JsonPath/)
* [JSON Patch](http://jsonpatch.com/)
