#!/bin/sh

# upgrade
kubectl config set-context --current --namespace prometheus
helm upgrade prometheus prometheus-community/kube-prometheus-stack \
-n prometheus \
--version "18.0.10" \
-f ./values.yaml

