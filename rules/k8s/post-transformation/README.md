# Kubernetes post-processing rules
This directory has a rule which is applied as post-processing rule for the kubernetes `k8s.Resources` deployment (see [CreateK8SIngress rule](stitch-rules.yaml)).

## Rule definition
Rule is applied for the `k8s.Resources` deployment type in the post-processing transformation phase, which would be deployed to the environment containing string `prod` in its name with and a condition that the `replicasSize` is not equal 1.
## Processors
Rule has just one processor of type `freemarker` which will overlay the [template](templates/k8s-ingress-example.ftl) and add it as an array of the output documents added to overall deployment.

The processor has `port` variable defined which is used to replace the freemarker parameter. Value of the variable is fetched from the environment dictionary using the SpEL expression `@dictionary.getValue('portNumber')`. 
## Templates
[Freemarker template](templates/k8s-ingress-example.ftl) used in the rule processor contains the simple ingress JSON as the element of array. The content used as input for the post-processing transformation has to be in form of an array containing JSON objects.

The passed in variable is used with mustache notation `${port}`. 
