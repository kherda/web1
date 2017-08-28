#!/usr/bin/env bash

kubectl delete -f config/k8s/service.yml
kubectl delete -f config/k8s/replication_controller.yml
