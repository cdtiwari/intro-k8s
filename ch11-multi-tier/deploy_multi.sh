#!/bin/sh

set -euxo pipefail

kubectl create -f rsvp-db.yaml
kubectl create -f rsvp-db-service.yaml
kubectl get deployments
kubectl get services

kubectl create -f rsvp-web.yaml
kubectl create -f rsvp-web-service.yaml
kubectl get deployments
kubectl get services

minikube ip

kubectl scale --replicas=4 -f rsvp-web.yaml
kubectl get deployments

kubectl delete -f ./
