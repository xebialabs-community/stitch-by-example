# Bootstrap the Configuration

**Note:** If you don't want to use some of the plugins alter the [bootstrap script](/deploy-config/demo-bootstrap.yaml) and comment them out.

Run your XL CLI in root directory of checked out project:
```
xl apply -f demo-bootstrap.yaml 
```
**Note:** Do not forget to adjust your `secret.xlvals` files to configure your infrastructure correctly.

This will fill in your CIs into the Deploy together with the Stitch Source pointing to this GitHub repository. Stitch rules and macros will be loaded in the system automatically, and you are ready to use the system and try it out.
