#!/bin/sh

# add repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

# install chart
kubectl create ns prometheus
helm install prometheus prometheus-community/kube-prometheus-stack \
-n prometheus \
--version "18.0.10"

