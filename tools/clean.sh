kubectl delete --all ingresses
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc
minikube stop
minikube delete
killall -TERM kubectl minikube VBoxHeadless
