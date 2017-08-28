#!/usr/bin/env bash

kubectl create -f config/k8s/replication_controller.yml
kubectl create -f config/k8s/service.yml
