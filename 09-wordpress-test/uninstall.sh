#!/usr/bin/env bash

# uninstall
kubectl config set-context --current --namespace wordpress-test
helm un wordpress-test
kubectl delete pvc data-wordpress-test-mariadb-0 
kubectl delete ns wordpress-test
