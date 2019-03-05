#!/bin/bash
images=(kube-proxy:v1.13.4 kube-scheduler:v1.13.4 kube-controller-manager:v1.13.4 kube-apiserver:v1.13.4 etcd:3.2.24 pause:3.1)
for imageName in ${images[@]} ; do
  sudo docker pull mirrorgooglecontainers/$imageName
  sudo docker tag mirrorgooglecontainers/$imageName k8s.gcr.io/$imageName
  sudo docker rmi mirrorgooglecontainers/$imageName
done

sudo docker pull carlziess/coredns-1.2.6
sudo docker tag k8s.gcr.io/coredns-1.2.6:latest k8s.gcr.io/coredns:1.2.6
sudo docker rmi carlziess/coredns-1.2.6

sudo docker pull jmgao1983/flannel:v0.11.0-amd64
sudo docker tag jmgao1983/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64
sudo docker rmi jmgao1983/flannel:v0.11.0-amd64
