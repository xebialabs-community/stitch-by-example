[{
  "apiVersion": "networking.k8s.io/v1",
  "kind": "Ingress",
  "metadata": {
    "name": "simple-ingress",
    "annotations": {
      "nginx.ingress.kubernetes.io/rewrite-target": "/$1"
    }
  },
  "spec": {
    "rules": [
      {
        "host": "localhost",
        "http": {
          "paths": [
            {
              "path": "/petclinic",
              "pathType": "Prefix",
              "backend": {
                "service": {
                  "name": "web",
                  "port": {
                    "number": ${port}
                  }
                }
              }
            }
          ]
        }
      }
    ]
  }
}]
