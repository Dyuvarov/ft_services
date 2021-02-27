#!/bin/bash
echo "minikube delete"
minikube delete
echo "minikube start"
minikube --vm-driver=virtualbox start
echo "eval $(minikube docker-env)"
eval $(minikube docker-env)
echo "docker build -t nginx_image ."
docker build -t nginx_image /srcs/nginx
echo "minikube addons enable metallb"
minikube addons enable metallb
echo "kubectl apply -f srcs/configmap.yaml"
kubectl apply -f srcs/configmap.yaml
echo "kubectl apply -f srcs/nginx.yaml"
kubectl apply -f srcs/nginx/nginx.yaml
