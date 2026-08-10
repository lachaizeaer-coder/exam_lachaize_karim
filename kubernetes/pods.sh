kubectl apply -f namespace.yaml

kubectl apply -f secret-postgress.yaml 
kubectl apply -f configmap-postgress.yaml

kubectl apply -f postgress.yaml 