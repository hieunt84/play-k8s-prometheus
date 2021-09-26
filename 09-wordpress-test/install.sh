#!/usr/bin/env bash

# add repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# install
kubectl create ns wordpress-test
helm install wordpress-test bitnami/wordpress -n wordpress-test -f ./values.yaml
