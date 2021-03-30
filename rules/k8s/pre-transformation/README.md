# Kubernetes pre-processing rules
This directory has a rule which is applied as pre-processing rule for the kubernetes `k8s.Resources` deployment (see [CreateK8SManifest rule](stitch-rules.yaml)).

## Rule definition
Rule is applied for the `k8s.Resources` deployment type in the pre-processing transformation phase, which would have a Deployed application named `k8s-app-zero-to-hero`.
## Processors
Rule has two processor of type `addYamlObject` which add Deployment and Service YAMLs used for k8s PetClinic application.

## Templates
Rule uses two YAML templates, one is for [Deployment](templates/k8s-petclinic-deployment.yaml) and second one is for [Service](templates/k8s-petclinic-service.yaml). Both templates will form an array of output documents used in further Stitch transformations. 
