#!/bin/bash

#sudo ctr -n k8s.io images import fastapi-app-exam.tar

sudo chmod 777 /etc/rancher/k3s/k3s.yaml

kubectl apply -f namespace.yaml

kubectl apply -f secret-postgress.yaml 
kubectl apply -f configmap-postgress.yaml

kubectl apply -f postgress.yaml
kubectl apply -f fastapi.yaml