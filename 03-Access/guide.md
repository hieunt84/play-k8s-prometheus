### guide access grafana UI
```
kubectl get depployment
kubectl port-forward deployment/prometheus-grafana 3000
http://localhost:3000
  user:admin
  pass:prom-operator
```

### guide access promethus UI
```
kubectl get pod
kubectl port-forward prometheus-prometheus-kube-prometheus-prometheus-0 9090
http://localhost:9090
```
