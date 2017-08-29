#!/usr/bin/env bash


gcloud auth application-default login


notes

gcloud config set compute/zone us-central1-a

demo-php

gcloud container clusters create demo-php \
  --num-nodes 3 \
  --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"

gcloud container clusters get-credentials {demo}


gcloud compute images create jenkins-home-image --source-uri https://storage.googleapis.com/solutions-public-assets/jenkins-cd/jenkins-home-v3.tar.gz
gcloud compute disks create jenkins-home --image jenkins-home-image

kubectl create secret generic jenkins --from-file=options --namespace=jenkins

kubectl get pods --namespace jenkins

kubectl get svc --namespace jenkins

kubectl get ingress --namespace jenkins

kubectl describe ingress jenkins --namespace jenkins




kubectl create namespace production
create namespace
list namespaces


kubectl create -f config/k8s/replication_controller.yml
kubectl create -f config/k8s/service.yml


docker build -t gcr.io/sgc-gke-tutorial/web1 .
gcloud docker -- push gcr.io/sgc-gke-tutorial/web1


kubectl scale --replicas=2 deployment/web1-deployment --namespace web-prod
