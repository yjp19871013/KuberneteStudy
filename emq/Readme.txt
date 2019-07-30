运行命令
kubectl proxy --accept-hosts="^.*$" --address='masterIP' -p=端口号
才可以进行kubectl create和kubectl delete等操作

