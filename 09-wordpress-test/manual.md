### Manual deployment
1. Step 01: config values.yaml
```
wordpressSkipInstall: false for init
wordpressSkipInstall: true for update

ingress:
  enable: true
  ingressClassName: "nginx"
  tls: true

persistence:
  enabled: true
  storageClass: "nfs-client"
  accessModes:
    - ReadWriteOnce

mariadb:
  enabled: true

metric
  enabled: true
...
```
2. Step 02: Install
```
sh install.sh
``` 

