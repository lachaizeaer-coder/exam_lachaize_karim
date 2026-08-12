#!/bin/bash

kubectl logs fastapi-deployment-78cddd8684-hfjfw -n standard > ~/exam_lachaize_karim/kubernetes/logs/logs-fastapi-deployment-78cddd8684-hfjfw.txt
kubectl logs fastapi-deployment-78cddd8684-kw9b6 -n standard > ~/exam_lachaize_karim/kubernetes/logs/logs-fastapi-deployment-78cddd8684-kw9b6.txt
kubectl logs fastapi-deployment-78cddd8684-wtbgm -n standard > ~/exam_lachaize_karim/kubernetes/logs/logs-fastapi-deployment-78cddd8684-wtbgm.txt

kubectl logs postgres-statefulset-0 -n standard > ~/exam_lachaize_karim/kubernetes/logs/logs-postgres-statefulset-0.txt