echo "\n\t\t➜ Activated Nodes\n"
kubectl get nodes

echo "\n\t\t➜ Deployments\n"
kubectl get deployments

echo "\n\t\t➜ Pods\n"
kubectl get pods

echo "\n\t\t➜ Services\n"
kubectl get services

# Open & test service
# minikube service <service> --url
# ex
#minikube service wordpress-service --url

# Enter in pod terminal
# kubectl exec -ti <pod> (ex : ftps-65f7c7b5f6-w9ftv) -- sh
