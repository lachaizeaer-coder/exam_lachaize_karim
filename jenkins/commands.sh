# Add Jenkins' user to Docker group so to pilot Docker engine
sudo usermod -aG docker jenkins

# Create Namespaces
sudo chmod 755 /etc/rancher/k3s/k3s.yaml  # Grant permission to k3s config file
kubectl create namespace dev
kubectl create namespace QA
kubectl create namespace staging
kubectl create namespace prod
